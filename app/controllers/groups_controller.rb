class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    group = current_user.groups.create(group_params)
    redirect_to group, notice: "Group successfully created"
  end

  def show
    @group = Group.find(params[:id])
    @current_event = @group.current_event
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
