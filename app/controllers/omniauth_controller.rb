class OmniauthController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :facebook

  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in again later.'
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "GitHub") if is_navigational_format?
    else
      flash[:error] = 'There was a problem signing you in through GitHUb. Please register or try signing in again later.'
      redirect_to new_user_registration_url
    end
  end
  
  def failure
    flash[:error] = 'There was a problem signing you in, please try again later.'
    redirect_to new_user_registration_url
  end
end