class Admin::WordsController < ApplicationController
  before_action :require_admin
  before_action :find_word, only:[:destroy, :edit, :update, :show]
  before_action :list_category, only:[:new, :edit]

  def index
    @words = Word.all
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = t('controllers.create.success')
      redirect_to admin_words_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @word.update(word_params)
      flash[:success] = t("controllers.update.success")
      redirect_to admin_words_path
    else
      render :edit
    end
  end

  def destroy
    @word.destroy
    flash[:success] = t("controllers.delete.success")
    redirect_to admin_words_path
  end

  private 
    def find_word
      @word = Word.find_by(id: params[:id])
      content_not_found unless @word.present?
    end

    def word_params
      params.require(:word).permit(:category_id, :word, :meaning, :note)
    end

    def list_category
      @categories = Category.all.map { |category| [category.name, category.id] }
    end
end
