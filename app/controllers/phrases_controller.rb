class PhrasesController < ApplicationController
  def index
    @categories = Category.all
    @phrases = Phrase.all
  end

  def ads
    @categories = Category.all
    @phrase = Phrase.find(params[:id])
    @ads = @phrase.ads
  end

end
