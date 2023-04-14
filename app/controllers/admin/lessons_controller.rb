class Admin::LessonsController < ApplicationController
  before_action :require_admin
  before_action :find_lesson, only: [:destroy, :show]

  def index
    if params[:lesson]
      @lessons =  Lesson.search(params[:lesson])
    else
      @lessons =  Lesson.all
    end
  end

  def new
    @lesson = Lesson.new
    @lesson.questions.build.answers.build
    # @categories = Category.all
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:success] = t('controllers.create.success')
      redirect_to admin_lessons_path
    else
      render "new"
    end
  end

  def show
  end

  def destroy
    @lesson.destroy
    flash[:success] = t('controllers.delete.success')
    redirect_to admin_lessons_path
  end

  private 

  def lesson_params 
    params.require(:lesson).permit(:category_id, :name,
      questions_attributes: [:id, :content, :_destroy,
        answers_attributes: [:id, :content, :correct_answer, :_destroy]
      ]
    )
  end

  def find_lesson
    @lesson = Lesson.find_by(id: params[:id])
    content_not_found unless @lesson.present?
  end
end
