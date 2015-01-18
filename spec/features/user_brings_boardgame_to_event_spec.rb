require "rails_helper"

RSpec.feature "User brings board game to event" do
  scenario "successfully" do
    user = create(:user)
    group = create(:group)
    user.groups << group
    boardgame = create(:boardgame, user: user)
    event = create(:event, group: group)
    visit group_path(group, as: user)
    select boardgame.name, from: "Game"
    click_button "submit"
    expect(page).to have_content("Bringing #{boardgame.name}")
  end
end
