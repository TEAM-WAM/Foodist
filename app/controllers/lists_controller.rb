class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def show
    @url = "/#{params[:id]}"
  end

  def index
  end

  def jgroup
    group = Group.find_by(id: params[:id])
    @lists = group.lists
    render 'index.json.jbuilder'
  end

  def jtrending
    lists_array = []
    @lists = []
    all_lists = List.all
    all_lists.each do |list|
      votes = list.votes.where(up: 'true').count - list.votes.where(up: 'false').count
      lists_array << {list => votes}
    end
    trending = lists_array.sort{ |a,b| a.values.flatten <=> b.values.flatten}.reverse[0..10]
    trending.each {|list| @lists << list.keys[0]}
    render 'index.json.jbuilder'
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
