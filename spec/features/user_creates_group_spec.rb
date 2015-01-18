require "rails_helper"

RSpec.feature "User creates group" do
  scenario "successfully" do
    user = create(:user)
    visit dashboard_path(as: user)
    click_link "Create Group"
    fill_in "Name", with: "test_name"
    click_button "Submit"
    expect(page).to have_content("Group successfully created")
  end
end
