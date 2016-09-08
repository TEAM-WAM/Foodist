class ListExperiencesController < ApplicationController

  def create
    experience = ListExperience.create(list_experience_params)
    render json: experience
  end

  private
  def list_experience_params
    params.require(:data).permit(:main_dish, :price, :party_size, :time_waiting, :notes, :date_of_experience, :list_restaurant_id)
  end

end
