class InvitationsController < ApplicationController
  def new
    @invitation = Invitation.new
    @group = find_group
  end

  def show
    @invitation = find_invitation
    @group = @invitation.group

    if @invitation.complete
      redirect_to @invitation.group
    end
  end

  def update
    # create the user
    @invitation = find_invitation
    sign_up(params[:invitation][:user])
    @invitation.complete
    redirect_to @invitation.group
  end

  def create
    group = find_group
    invitation = group.invitations.create(invitation_params)
    invitation.deliver
    redirect_to group
  end

  private

  def find_invitation
    @_invitation ||= Invitation.find_by(code: params[:id])
  end

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
