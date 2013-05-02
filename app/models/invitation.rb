class Invitation < ActiveRecord::Base

  validates :email,
    format: {
      with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
      message: 'invalid email address'
  }

  after_create :send_invitation_email

  private

  def send_invitation_email
    Notifications.invitation(self).deliver
  end
end
