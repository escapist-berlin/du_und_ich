class PhrasesController < ApplicationController
  def index
    @categories = Category.all
    @phrases = Phrase.all
  end

  # def shuffle(phrase)
  #   phrase = @phrases.all
  #   phrase.sort_by { rand }
  # end

  def ads
    @categories = Category.all
    @phrase = Phrase.find(params[:id])
    @ads = @phrase.ads
  end

end
