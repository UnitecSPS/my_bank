class UserMailer < ActionMailer::Base
  default from: "customercare@mybank.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome a My Bank")
  end
end
