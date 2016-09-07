class ListRestaurantsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    list_restaurant = @list.restaurants.where(restaurant_id: @restaurant.id)

    if list_restaurant.length == 0
      @list.restaurants << @restaurant
    end

  end

end
