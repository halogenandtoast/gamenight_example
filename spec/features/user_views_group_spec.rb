require "rails_helper"

RSpec.feature "User views group" do
  scenario "and sees group members" do
    users = create_list(:user, 5) 
    group = create(:group) 
    users.each { |user| user.groups << group }
    visit group_path(group, as: users.first)
    users.each do |user|
      expect(page).to have_content(user.name)
    end
  end
end
