require "rails_helper"

RSpec.feature "User takes a seat" do
  scenario "successfully" do
    user = create(:user)
    group = create(:group)
    user.groups << group
    event = create(:event, group: group)
    boardgame = create(:boardgame, name: "Machi Koro")
    event.boardgames << boardgame
    create(:rsvp, event: event, user: user)
    visit group_path(group, as: user)
    click_link "Take seat"
    within "#boardgame_#{boardgame.id}" do
      expect(page).to have_css("[data-role=seats]", text: user.name)
    end
  end
end
