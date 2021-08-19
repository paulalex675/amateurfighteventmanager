class EventMailer < ApplicationMailer
  default from: 'amateurfighteventmanager@outlook.com'

  def matched_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(
      to: email_address_with_name(@user.email, @user.first_name),
       subject: 'You have been matched!')
  end
end
