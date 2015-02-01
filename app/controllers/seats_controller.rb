class SeatsController < ApplicationController
  def create
    @boardgame_option = BoardgameOption.find(params[:boardgame_option_id])
    @seat = current_user.seats.create(boardgame_option: @boardgame_option)

    redirect_to @boardgame_option.group
  end
end
