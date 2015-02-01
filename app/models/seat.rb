class Seat < ActiveRecord::Base
  belongs_to :boardgame_option
  belongs_to :user

  delegate :name, to: :user, prefix: true
end
