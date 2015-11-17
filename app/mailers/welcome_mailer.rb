class WelcomeMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Swapr!")
  end

  def prime(user, count, result)
    @count = count
    @user = user
    @result = result
    mail(to: user.email, subject: "Your Magic Answer Is...")
  end
end
