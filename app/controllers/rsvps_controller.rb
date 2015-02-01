class RsvpsController < ApplicationController
  def create
    rsvp = current_user.rsvps.create(event: find_event)
    redirect_to rsvp.group
  end

  private

  def find_event
    Event.find(params[:event_id])
  end
end
