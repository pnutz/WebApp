class TT_Mailer < ActionMailer::Base
  default from: "from@example.com"

  def new_trouble_ticket(user, subject, content)
    @user = user
    @content = content
    @timestamp = Time.now
    mail(to: "contact@tworeceipt.com", from: @user.email, subject: subject)
  end
end
