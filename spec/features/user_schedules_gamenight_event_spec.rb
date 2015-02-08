require "rails_helper"

RSpec.feature "User schedules gamenight event" do
  scenario "succesfully", travel_to: Time.new(2015, 1, 11) do
    group_page = create_group_page

    group_page.schedule_event Date.civil(2015, 1, 18)

    expect(group_page).to have_event_scheduled_on "1/18/15"
  end

  def create_group_page
    GroupPage.new
  end
end
