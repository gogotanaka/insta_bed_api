class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def index
    @invitations = Invitation.all
  end

  def show
  end

  def new
    @invitation = Invitation.new
    2.times { @invitation.images.build }
  end

  def edit
  end

  def create
    binding.pry
    @invitation = Invitation.new(permit_params)
    @invitation.user = current_user

    respond_to do |format|
      if @invitation.save
        format.html { redirect_to @invitation, notice: 'Invitation was successfully created.' }
        format.json { render :show, status: :created, location: @invitation }
      else
        format.html { render :new }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invitation.update(invitation_params)
        format.html { redirect_to @invitation, notice: 'Invitation was successfully updated.' }
        format.json { render :show, status: :ok, location: @invitation }
      else
        format.html { render :edit }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private def set_invitation
    @invitation = Invitation.find(params[:id])
  end

   private  def permit_params
    params.
    require(:invitation).
    permit(
      :price,
      :address,
      :describe,
      :email,
      :image,
      {
        images_attributes: [
          :image
        ]
      }
    )
  end
end
