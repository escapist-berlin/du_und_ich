class AdsController < ApplicationController
  def index
    @ads = Ad.all
  end
end
