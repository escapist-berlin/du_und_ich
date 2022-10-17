class AdsController < ApplicationController
  def index
    @ads = Ad.all
    @categories = Category.all

    if params[:query].present?
      @ads = @ads.where(decade: params[:query])
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      # format.text { render partial: 'list.html', locals: { movies: @movies } }
    end

  end

end
