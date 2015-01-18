require 'rails_helper'

RSpec.feature "User registers" do
  scenario "successfully" do
    visit '/'
    click_link 'register'
    fill_in 'Name', with: 'test_name' 
    fill_in 'Password', with: 'test_password'
    fill_in 'Email', with: 'test_email'
    click_button 'Sign up'
    expect(page).to have_content('Welcome, test_name')
  end
end
