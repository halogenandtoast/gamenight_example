class BoardgameOptionsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @boardgame_option = @event.boardgame_options.create(boardgame_option_params)
    redirect_to @event.group
  end

  private

  def boardgame_option_params
    params.require(:boardgame_option).permit(:boardgame_id)
  end
end
