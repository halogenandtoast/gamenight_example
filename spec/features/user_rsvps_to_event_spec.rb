require "rails_helper"

RSpec.feature "user rsvps to event" do
  scenario "successfully" do
    user = create(:user)
    group = create(:group)
    user.groups << group
    event = create(:event, date: 1.day.from_now)
    group.events << event
    visit group_path(group, as: user)
    click_link "RSVP"
    expect(page).to have_css("[data-role=attendees]", text: user.name)
  end
end
