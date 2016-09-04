class GroupsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  def index
    @user = User.find(current_user.id)
    @groups = Group.all
  end

  def show
    @user = User.find(current_user.id)
    @group = Group.find(params[:id])
  end

  def new
    @user = User.find(current_user.id)
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.save
      redirect_to groups_path
  end

  def add
    @user = User.find(params[:user_id])
    @group= Group.find(params[:group_id])
    @group.members << @user
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :creator_id, :avatar)
  end

end
