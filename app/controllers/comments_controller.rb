class CommentsController < ApplicationController

  def create
    @comment = Comment.new(user_id: current_user.id, body: params[:body], commentable_id: params[:commentable_id], commentable_type: params[:commentable_type].chop)
    @comment.save
    render 'show.json.jbuilder'
  end

  def jrestaurants
    restaurant = Restaurant.find(params[:id])
    @comments = restaurant.comments
    render 'index.json.jbuilder'
  end

  def jlists
    list = List.find(params[:id])
    @comments = list.comments
    render 'index.json.jbuilder'
  end

  private
  def comment_params
    params.permit(:body, :type, :id)
  end

end
