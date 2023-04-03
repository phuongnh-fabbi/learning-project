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
    respond_to do |format|
      format.html
      format.csv do
        filename = ['Words', Date.today.to_s].join(' ')
        send_data Word.to_csv(@words), filename: filename, content_type: 'text/csv'
      end
    end
  end

  private 
    def find_category 
      @category = Category.find_by(id: params[:id])
      content_not_found unless @category.present?
    end
end
