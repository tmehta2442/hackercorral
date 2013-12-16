class HackerMailer < ActionMailer::Base
  default from: "hackercorral@gmail.com"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign Up Confirmation"
  end
end
