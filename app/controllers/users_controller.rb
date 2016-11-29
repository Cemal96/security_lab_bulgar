class UsersController < ApplicationController

  before_filter :blocked?

  def home
  end

  private

  def blocked?
    if user_signed_in? && current_user.blocked
      render :text => 'You are blocked! Ha-ha', :status => '404'
    end
  end
end
