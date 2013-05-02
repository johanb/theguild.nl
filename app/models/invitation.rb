class Invitation < ActiveRecord::Base

  validates :email,
    format: {
      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
      message: 'invalid email address'
  }

  after_create :send_invitation_email

  private

  def send_invitation_email
    self.token = generate_token
    Notifications.invitation(self).deliver
  end

  def generate_token
    Time.now.to_i.to_s(14)
  end
end
