require 'uri'

class HomeController < ApplicationController
  def index
    if params[:query] != nil
      q = URI.encode(params[:query])
      @results = Echonest.song(q)
    end
  end

  def show
    @result = paramms[:query]
  end

end
