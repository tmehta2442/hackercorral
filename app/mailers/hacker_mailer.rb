class HackerMailer < ActionMailer::Base
  default from: "hackercorral@gmail.com"

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def event_confirmation(user)
  	@user = user
  	mail to: user.email, subject: "You Created an Event!"
  end

  def user_signup(user)
  	@user = user
  	mail to: user.email, subject: "Someone Signed up for your event"
  end
end
