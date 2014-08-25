class RoundMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_round_alert_email(user)
    @url = 'http://www.google.com'
    mail(to: user.email, subject: 'New Game')
  end
end
