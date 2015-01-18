class EventsController < ApplicationController
  def new
    @group = Group.find(params[:group_id])
    @event = Event.new
  end

  def create
    @group = Group.find(params[:group_id])
    @event = @group.events.create(event_params)
    redirect_to @group
  end

  private

  def event_params
    params.require(:event).permit(:date)
  end
end
