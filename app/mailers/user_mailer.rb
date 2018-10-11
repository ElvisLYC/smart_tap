class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = User.find(user.id)
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Welcome to Smart Tap Solutions')
  end
end
