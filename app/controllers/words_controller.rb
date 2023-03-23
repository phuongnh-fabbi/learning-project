class WordsController < ApplicationController
  def show
    find_word
  end

  private 
  def find_word
    @word = Word.find_by(id: params[:id])
    content_not_found unless @word.present?
  end
end
