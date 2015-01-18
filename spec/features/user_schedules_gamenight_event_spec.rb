require "rails_helper"

RSpec.feature "User schedules gamenight event" do
  scenario "succesfully" do
    travel_to Time.new(2015, 1, 11) do
      user = create(:user)
      group = create(:group)
      user.groups << group
      visit group_path(group, as: user)
      click_link "Schedule event"
      select_date Date.civil(2015, 1, 18), from: "event_date"
      click_button "Submit"
      expect(page).to have_css("[data-role=event-date]", text: "1/18/15")
    end
  end
end
