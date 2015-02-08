class GroupPage < PageObject
  def self.with_event
    new.tap do |group|
      group.create_event
    end
  end

  def initialize
    @user = create(:user)
    @group = create(:group)
    @user.groups << @group
  end

  def create_event
    create(:event, group: @group)
  end

  def create_game_for_current_user
    create(:boardgame, user: @user)
  end

  def visit
    super group_path(@group, as: @user)
  end

  def has_game_being_brought? boardgame
    page.has_content?("Bringing #{boardgame.name}")
  end

  def select_game_to_bring boardgame
    select boardgame.name, from: "Game"
    click_button "submit"
  end

  def schedule_event date
    visit
    click_link "Schedule event"
    select_date date, from: "event_date"
    click_button "Submit"
  end

  def invite_user(email)
    visit
    click_link "Invite user"
    fill_in "Email", with: email
    click_button "Send"
  end

  def has_event_scheduled_on? date
    page.has_css?("[data-role=event-date]", text: date)
  end

  def has_member? user
    page.has_content?(user.name)
  end
end
