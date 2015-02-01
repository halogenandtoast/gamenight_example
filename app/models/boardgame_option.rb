class BoardgameOption < ActiveRecord::Base
  belongs_to :event
  belongs_to :boardgame
  has_many :seats

  delegate :name, to: :boardgame
  delegate :group, to: :event
end
