require_relative "../../lib/api.rb"

class RootController < ApplicationController
  include Zomato

  def index
    #pass down restaurant info for landing page
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def search
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @query = params[:search]
    @location_query = params[:location]
    @new_search = Zomato::API.new
    if params[:location]
      @new_search.location(@location_query)
      lat = @new_search.response["location_suggestions"][0]["latitude"]
      lon = @new_search.response["location_suggestions"][0]["longitude"]
      @new_search.search_with_location(@query, lat, lon)
    else
      @new_search.search(@query)
    end
  end

end
