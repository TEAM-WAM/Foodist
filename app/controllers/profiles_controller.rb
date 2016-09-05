class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update]

  def show
    # @user = User.find(params[:id])
    # if @user.profile
    #   @profile = Profile.find_by(user_id: params[:id])
    # else
    #   new_profile = @user.build_profile
    #   new_profile.save
    #   @profile = Profile.find_by(user_id: params[:id])
    # end
    @profile = Profile.find_by(user_id: params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
  end

end
