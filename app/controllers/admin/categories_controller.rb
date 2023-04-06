class Admin::CategoriesController < ApplicationController
  before_action :require_admin
  before_action :find_category, only: [:update, :edit, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new    
    @url = new_admin_category_path
  
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success] = t("controllers.create.success")
      redirect_to admin_categories_path
    else 
      render :new
    end
  end

  def edit
    @url = edit_admin_category_path(@category)
  end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html
        format.js
      end
      flash[:success] = t("controllers.update.success")
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    flash[:success] = t("controllers.delete.success")
    redirect_to admin_categories_path
  end

  private

  def find_category
    @category = Category.find_by(id: params[:id])
    content_not_found unless @category.present?
  end

  def category_params
    params.require(:category).permit(:name, :total_exam, :total_word, :description)
  end

end
