require 'rails_helper'

RSpec.feature "User registers" do
  scenario "successfully" do
    visit '/'
    click_link 'register'
    fill_in 'name', with: 'test_name' 
    fill_in 'password', with: 'test_password'
    fill_in 'email', with: 'test_email'
    click_button 'submit'
    expect(page).to have_content('Welcome, test_name')
  end
end
