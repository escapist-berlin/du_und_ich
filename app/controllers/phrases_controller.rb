class PhrasesController < ApplicationController
  def index
    @categories = Category.all
    @phrases = Phrase.all

    # Splitting all phrases into 24 groups / rows
    @splitted_phrases = groups(@phrases, 24)
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

  private

  # This method divides phrases into equally-sized (+/-1) parts
  def groups(enum, numgroups)
    enum.chunk.with_index { |_, idx|
      (idx * numgroups / enum.count)
    }.map(&:last)
  end

end
