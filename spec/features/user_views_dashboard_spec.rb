require "rails_helper"

RSpec.feature "User views dashboard" do
  scenario "sees groups they belong to" do
    group = visit_dashboard_with_group
    expect(page).to have_content(group.name)
  end

  scenario "can visit a group they belong to" do
    group = visit_dashboard_with_group
    click_link group.name
    expect(page).to have_css("h1", text: group.name)
  end

  def visit_dashboard_with_group
    create(:group).tap do |group|
      user = create(:user)
      user.groups << group
      visit dashboard_path(as: user)
    end
  end
end
