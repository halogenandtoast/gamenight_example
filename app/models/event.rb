class Event < ActiveRecord::Base
  belongs_to :group
  has_many :boardgame_options
  has_many :boardgames, through: :boardgame_options

  def self.current
    where("date > ?", Date.current).
      order(:date)
  end
end
