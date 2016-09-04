class ListsController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end
end
