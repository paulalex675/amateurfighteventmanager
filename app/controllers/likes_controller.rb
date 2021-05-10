class LikesController < ApplicationController
  before_action :set_like, only: %i[ show destroy ] 
  

  def new
    @like = Like.new
  end

  def create
    @like = Like.new(liker_id: current_user.id, likeable_id: params[:likeable_id], likeable_type: params[:likeable_type])

    respond_to do |format|
      if @like.save
        format.html { redirect_to posts_url, notice: "You liked this!" }
        #format.json { render :show, status: :created, location: @likeable }
       #Notification.create(recipient: User.find(params[:receiver_id]), actor: current_user, action: 'liked', notifiable: @like)
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end    

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "You unliked this post...sad times." }
      format.json { head :no_content }
    end
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

end