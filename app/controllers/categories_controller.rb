class CategoriesController < ApplicationController
  def index
    if params[:category]
      @categories =  Category.search(params[:category])
    else
      @categories =  Category.all
    end
  end

  def show
    find_category
    @words = @category&.words
  end

  private 
    def find_category 
      @category = Category.find_by(id: params[:id])
      content_not_found unless @category.present?
    end
end
