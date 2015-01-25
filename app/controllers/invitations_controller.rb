class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @group = find_group
  end

  def show
    invitation = Invitation.find_by(code: params[:id])
    invitation.complete
    redirect_to invitation.group
  end

  def create
    group = find_group
    invitation = group.invitations.create(invitation_params)
    invitation.deliver
    redirect_to group
  end

  private

  def find_group
    current_user.groups.find(params[:group_id])
  end

  def invitation_params
    params.
      require(:invitation).
      permit(:email).
      merge(sender: current_user)
  end
end
