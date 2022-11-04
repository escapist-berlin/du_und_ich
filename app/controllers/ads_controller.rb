class AdsController < ApplicationController
  def index
    @ads = Ad.all
    @ads2 = groups(@ads, 2)
    @ads4 = groups(@ads, 4)
    @ads6 = groups(@ads, 6)
    @categories = Category.all

    if params[:query].present?
      @ads = @ads.where(decade: params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      # format.text { render partial: 'list.html', locals: { movies: @movies } }
    end

  end

  private

  # This method divides ads into equally-sized (+/-1) parts
  def groups(enum, numgroups)
    enum.chunk.with_index { |_, idx|
      (idx * numgroups / enum.count)
    }.map(&:last)
  end

end
