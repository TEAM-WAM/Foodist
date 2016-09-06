class GroupsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :add]

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @id = params[:id]
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def add
    @user = User.find(params[:user_id])
    @group= Group.find(params[:group_id])
    @group.members << @user
    redirect_to groups_path
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description, :creator_id, :avatar)
  end

end
