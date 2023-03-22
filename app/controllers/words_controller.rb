class WordsController < ApplicationController
  def show
    @word = Word.find_by(id: params[:id])
  end
end
