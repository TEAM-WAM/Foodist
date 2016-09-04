class RootController < ApplicationController

  def index
    #pass down restaurant info for landing page
    if user_signed_in?
      @user = User.find(current_user.id)
    end

  end

end
