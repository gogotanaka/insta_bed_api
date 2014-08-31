class WelcomeController < ApplicationController
  def index
    @invitations = Invitation.where(booking_user_id: nil)
  end
end
