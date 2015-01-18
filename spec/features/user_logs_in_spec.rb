require 'rails_helper'

RSpec.feature "User logs in" do
  scenario "successfully" do
    user = create(:user)
    visit '/'
    click_link 'login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password_digest
    click_button 'Sign in'
    expect(page).to have_content("Welcome, #{user.name}")
  end
end
