class LikesController < ApplicationController
  before_action :set_like, only: %i[ show destroy ] 
  

  def new
    @like = Like.new
  end

  def create
    @like = @likeable.likes.new
    @like.liker = current_user

    respond_to do |format|
      if @like.save
        format.html { redirect_back fallback_location: @likeable, notice: "You liked this!" }
        format.json { render :show, status: :created, location: @likeable }
        if @likeable.class == Event
          Notification.create(recipient_id: @likeable.host.owner.id, actor_id: current_user.id, action: 'liked', notifiable: @like.likeable)
        elsif @likeable.class == Gym
          Notification.create(recipient_id: @likeable.owner.id, actor_id: current_user.id, action: 'liked', notifiable: @like.likeable)
        else
          Notification.create(recipient_id: @likeable.user.id, actor_id: current_user.id, action: 'liked', notifiable: @like.likeable)
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end    

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to @like.likeable, notice: "You unliked this post...sad times." }
      format.json { head :no_content }
    end
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

end