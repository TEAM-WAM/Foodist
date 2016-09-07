class ListRestaurantsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @list.restaurants << @restaurant
  end

end
