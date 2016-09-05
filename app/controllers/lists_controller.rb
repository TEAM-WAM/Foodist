class ListsController < ApplicationController

  before_action :authenticate_user!, only: [:show]
  def show
    # @user = User.find(current_user.id)
  end

  def trending
    # @lists = List.where(:votes ) limit 10
    # render 'trending.jbuilder.json'
  end

end
