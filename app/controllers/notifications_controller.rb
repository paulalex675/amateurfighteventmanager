class NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show destroy update ] 

  def index
    @notifications = Notification.all
  end

  def new
    @notification = Notification.new
  end

  def create
    @notification = Notification.new
    if recipient_id != actor_id
      @notification.save
    else @notification.destroy
    end
  end

  def edit 
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to notifications_path, notice: "Notification has been read." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @notification.destroy
  end

  private

  def set_notification
    @notification = Notification.find(params[:id])
  end

  def notification_params
    params.require(:notification).permit(:notifiable_id, :actor_id, :read_at, :notifiable_type, :recipient_id, :action)
  end

end