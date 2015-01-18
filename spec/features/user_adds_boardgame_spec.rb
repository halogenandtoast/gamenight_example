require "rails_helper"

RSpec.feature "user adds boardgame" do
  scenario "successfully" do
    user = create(:user)
    visit dashboard_path(as: user)
    click_link "Add Boardgame"
    fill_in "Name", with: "monopoly"
    click_button "submit"
    expect(page).to have_content "Successfully created boardgame"
    expect(page).to have_css("[data-role=boardgames]", text: "monopoly")
  end
end
