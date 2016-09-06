class VotesController < ApplicationController

  before_action :authenticate_user!, only: [:create]


  def create
    up_vote = params[:vote][:up]
    vote = Vote.new(votes_params)
    if current_user.votes.where(voteable_id: vote.voteable_id, voteable_type: vote.voteable_type).length == 0
      if up_vote
        vote.save
        @vote_number = 1
      else
        vote.save
        @vote_number = -1
      end
    else
      @vote_numer = 0
    end
    render json: @vote_number
  end

  private

  def votes_params
    params.require(:vote).permit(:voteable_type, :voteable_id, :user_id, :up)
  end
end
