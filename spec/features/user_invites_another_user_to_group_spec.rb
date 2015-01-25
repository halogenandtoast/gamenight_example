require "rails_helper"

RSpec.feature "User invites another user to group" do
  scenario "where user already has an account" do
    user = create(:user)
    another_user = create(:user)
    group = create(:group)
    user.groups << group
    visit group_path(group, as: user)
    click_link "Invite user"
    fill_in "Email", with: another_user.email
    click_button "Send"

    using_session another_user.email do
      open_email(another_user.email)
      click_first_link_in_email
      expect(another_user.groups).to include(group)
      expect(page).to have_content(group.name)
    end
  end
end
