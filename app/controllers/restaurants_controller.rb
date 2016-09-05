class RestaurantsController < ApplicationController

  before_action :authenticate_user!, only: [:show, :index]

  def index
    @restaurants = Restaurant.all
    all_rests = []
    @restaurants.each do |rest|
      all_rests << { rest.name => rest.votes.count }
    end
    all_rests.sort!{ |a,b| a.values.flatten <=> b.values.flatten }.reverse!
    top_ten = all_rests[0...10]
    @top_ten_obj = []
    top_ten.map do |rest|
      @top_ten_obj << Restaurant.find_by(name: rest.keys )
    end
  end

  def show

  end

end
