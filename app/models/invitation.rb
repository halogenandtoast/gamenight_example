class Invitation < ActiveRecord::Base
  belongs_to :group
  belongs_to :sender, class_name: "User"
  before_create :generate_code

  def generate_code
    code = SecureRandom.hex
    write_attribute(:code, code)
  end

  def complete
    if receiver
      receiver.join_group(group)
      destroy
    end
  end

  def to_param
    code
  end

  def deliver
    InvitationMailer.invite(self).deliver
  end

  private

  def receiver
    User.find_by(email: email)
  end
end
