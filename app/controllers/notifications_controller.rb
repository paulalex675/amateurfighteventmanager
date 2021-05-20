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
    @notification.save
  end

  def update
    respond_to do |format|
      if @notification.update(params)
        format.html { redirect_to @notification, notice: "Notification has been read." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @like.destroy
  end

  private

  def set_notification
    @notifcation = Notification.find(params[:id])
  end

end