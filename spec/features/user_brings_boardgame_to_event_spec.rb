require "rails_helper"

RSpec.feature "User brings board game to event" do
  scenario "successfully" do
    group_page = create_group_page
    boardgame = group_page.create_game_for_current_user

    group_page.visit
    group_page.select_game_to_bring boardgame

    expect(group_page).to have_game_being_brought(boardgame)
  end

  def create_group_page
    GroupPage.with_event
  end
end
