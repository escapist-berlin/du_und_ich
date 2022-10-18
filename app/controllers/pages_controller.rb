class PagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def about
    @categories = Category.all
  end
end
