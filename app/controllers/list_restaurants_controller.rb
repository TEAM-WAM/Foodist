class ListRestaurantsController < ApplicationController

  def create
    @list = List.find(params[:list_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    list_restaurant = @list.restaurants.where(restaurant_id: @restaurant.id)

    if list_restaurant.length == 0
      @list.restaurants << @restaurant
    end

  end

  def update
    list_restaurant = ListRestaurant.find(params[:list_restaurant][:id])
    if params[:updating] == "tried" && !list_restaurant.tried && list_restaurant.list.listable
      list_restaurant.update(tried: true)
    else
      list_restaurant.update(tried: false)
    end
    render json: list_restaurant
  end

end
