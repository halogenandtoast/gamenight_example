class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :group_memberships, foreign_key: :member_id
  has_many :groups, through: :group_memberships
  has_many :rsvps
  has_many :seats

  has_many :boardgames

  def join_group(group)
    groups << group
  end
end
