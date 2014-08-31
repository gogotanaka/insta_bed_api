class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  def index
  end

  def show
  end

  def edit
  end

  def book
    @invitation = Invitation.find(params[:invitation_id])
    @invitation.booking_user = current_user
    @invitation.save
    redirect_to current_user
  end

  def booked
    @invitation = Invitation.find(params[:invitation_id])
  end


  private def set_user
    @user = User.find(params[:id])
  end
end
