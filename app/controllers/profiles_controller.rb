class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update]
  def index
  end
  def show
    @user = User.find(current_user.id)
    check_user = User.find(params[:id]).profile
    if check_user
      @profile = Profile.find(params[:id])
      @profile_user = User.find(Profile.find(params[:id]).user_id)
    else
      new_profile = @user.build_profile
      new_profile.save
      @profile = Profile.find_by(user_id: params[:id])
      @profile_user = User.find(Profile.find(params[:id]).user_id)
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
  end

  private
  def profile_params
    params.permit[:id]
  end

end
