class BoardgameOption < ActiveRecord::Base
  belongs_to :event
  belongs_to :boardgame
end
