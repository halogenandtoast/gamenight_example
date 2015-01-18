class BoardgamesController < ApplicationController
  def new
    @boardgame = Boardgame.new
  end

  def create
    @boardgame = current_user.boardgames.create(boardgame_params)
    redirect_to dashboard_path, notice: "Successfully created boardgame"
  end

  private

  def boardgame_params
    params.require(:boardgame).permit(:name)
  end
end
