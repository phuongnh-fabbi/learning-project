class CategoriesController < ApplicationController
  def index
    if(params[:category])
      @categories =  Category.search(params[:category])
    else
      @categories =  Category.all
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
    @words = @category.words
  end
end
