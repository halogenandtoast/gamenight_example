require "rails_helper"

RSpec.feature "User invites another user to group" do
  scenario "where user already has an account" do
    group_page = create_group_page
    another_user = create(:user)

    group_page.invite_user(another_user.email)

    accept_invitation_for another_user.email do
      expect(group_page).to have_member(another_user)
    end
  end

  scenario "where user does not already have an account" do
    email = "not_a_user@example.com"
    group_page = create_group_page
    group_page.invite_user(email)

    accept_invitation_for email do
      another_user = submit_invitation_form_for(email)
      expect(group_page).to have_member(another_user)
    end
  end

  def submit_invitation_form_for(email)
    fill_in "Name", with: "A user"
    fill_in "Password", with: "password"
    click_button "Create"
    User.find_by!(email: email)
  end

  def accept_invitation_for(email)
    using_session email do
      open_email(email)
      click_first_link_in_email
      yield
    end
  end

  def create_group_page
    GroupPage.new
  end
end
