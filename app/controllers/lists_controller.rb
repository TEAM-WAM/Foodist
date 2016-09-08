class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
      @lists = current_user.lists if current_user
      lists_array = []
      @trending = []
      all_lists = List.all
      all_lists.each do |list|
        votes = list.votes.where(up: 'true').count - list.votes.where(up: 'false').count
        lists_array << {list => votes}
      end
      trending = lists_array.sort{ |a,b| a.values.flatten <=> b.values.flatten}.reverse[0..10]
      trending.each {|list| @trending << list.keys[0]}
  end

  def show
      @url = "/#{params[:id]}"
      @list = List.find(params[:id])

  end

  def update
    if params[:updating] == "title"
      list = List.find(params[:list][:id])
        if current_user == list.listable
          list.update(title: params[:title])
          # binding.pry
          render json: list
        end
    else
      if request.xhr?
        @list = List.find(params[:id])

        if @list.restaurants.include?(Restaurant.find(params[:rest_id]))
          render json: "true".to_json
        else
          render json: "false".to_json
        end
      end
    end
  end

  def new
    session[:return_to] ||= request.referer
    @list = List.new
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      redirect_to session.delete(:return_to)
    else
      render 'new'
    end
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

  def glistsnew
    group = Group.find(params[:id])
    @list = group.lists.new(list_params)
    if @list.save
      render json: @list
    end
  end

  private
  def list_params
    params.require(:list).permit(:id, :title)
  end
end
