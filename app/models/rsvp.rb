class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  delegate :group, to: :event
end
