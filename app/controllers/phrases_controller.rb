class PhrasesController < ApplicationController
  def index
    @categories = Category.all
    @phrases = Phrase.all
  end

 

  def ads
    @phrase = Phrase.find(params[:id])
    @ads = @phrase.ads
  end

end
