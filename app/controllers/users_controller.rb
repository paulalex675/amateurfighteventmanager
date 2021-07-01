class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all 
  end
    
  def show
    @user = User.find(params[:id])
  end

  def delete_image
    image = ActiveStorage::Attachment.find(params[:image_id])
    if current_user == image.record || current_user.is_admin?
      image.purge
      redirect_back(fallback_location: request.referer)
    else redirect_to root_url, notice: "Ah Ah Ah! You don't have permission to do that"
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
end