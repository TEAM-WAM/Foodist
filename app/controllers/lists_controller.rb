class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @url = "/#{params[:id]}"
  end

  def index
  end

  def trending
    # @lists = List.where(:votes ) limit 10
    # render 'trending.jbuilder.json'
    # @user = User.find(current_user.id)
  end

  def jshow
    @list = List.find_by(id: params[:id])

    render 'show.json.jbuilder'
  end

  def jindex
    @lists = List.all
    render 'index.json.jbuilder'
  end

  private
  def list_params
    params.require(:id).permit(:id, :title)
  end
end
