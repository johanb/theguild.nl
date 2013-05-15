class InvitationMessages < ActionMailer::Base
  default from: 'staff@theguild.nl'

  def request_invitation(email)
    mail to: email, subject: 'Your invitation request at The Guild'
  end
end
