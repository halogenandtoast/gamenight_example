require "rails_helper"

RSpec.feature "User invites another user to group" do
  scenario "where user already has an account" do
    another_user = create(:user)
    group = create(:group)

    invite_user_to_group(another_user.email, group)

    using_session another_user.email do
      open_email(another_user.email)
      click_first_link_in_email
      expect(another_user.groups).to include(group)
      expect(page).to have_content(group.name)
    end
  end

  scenario "where user does not already have an account" do
    group = create(:group)

    invite_user_to_group("not_a_user@example.com", group)

    using_session "not_a_user@example.com" do
      open_email("not_a_user@example.com")
      click_first_link_in_email

      fill_in "Name", with: "A user"
      fill_in "Password", with: "password"
      click_button "Create"

      another_user = User.find_by!(email: "not_a_user@example.com")
      expect(another_user.groups).to include(group)
      expect(page).to have_content(group.name)
    end
  end

  def invite_user_to_group(email, group)
    user = create(:user)
    user.groups << group
    visit group_path(group, as: user)
    click_link "Invite user"
    fill_in "Email", with: email
    click_button "Send"
  end
end
