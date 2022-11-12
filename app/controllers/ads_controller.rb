class AdsController < ApplicationController
  def index
    @categories = Category.all

    # If there is a decade in query:
    if params[:decade].present?
      @ads = Ad.where(decade: params[:decade])
      @ads2 = groups(@ads, 2)
      @ads4 = groups(@ads, 4)
      @ads6 = groups(@ads, 6)
    else
      @ads = Ad.all
      @ads2 = groups(@ads, 2)
      @ads4 = groups(@ads, 4)
      @ads6 = groups(@ads, 6)
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
