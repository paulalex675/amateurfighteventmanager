class UserMailer < ApplicationMailer
  default from: 'amateurfighteventmanager@outlook.com'
  
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(
      to: email_address_with_name(@user.email, @user.first_name),
       subject: 'Welcome to My Awesome Site')
  end
end
