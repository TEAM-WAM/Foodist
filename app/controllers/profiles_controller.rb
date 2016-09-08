class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: [:show, :edit, :update]

  def index
  end

  def show
    @user = User.find(current_user.id)
    check_user = User.find(params[:id]).profile
    if check_user.present?
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
    @user = User.find(current_user.id)
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(edit_profile_params)
      # file = params[:profile][:avatar]
      # File.open(Rails.root.join('app', 'assets','images', file.original_filename), 'wb')
      # f.write(file.read)
      redirect_to @profile
    else
      render 'edit'
    end
  end

  private
  def profile_params
    params.permit[:id]
  end

  def edit_profile_params
    params.require(:profile).permit(:bio, :zipcode, :birthday, :avatar, :phone_number, :gender)
  end

end
