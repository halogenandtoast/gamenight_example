class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :members, through: :group_memberships
  has_many :events
  has_many :invitations

  def current_event
    events.current.first
  end
end
