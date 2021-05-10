class FriendRequestsController < ApplicationController
  before_action :set_friend_request, only: %i[ show edit update destroy ]

  # GET /friend_requests or /friend_requests.json
  def index
    @friend_requests = FriendRequest.all
  end

  # GET /friend_requests/1 or /friend_requests/1.json
  def show
  end

  # GET /friend_requests/new
  def new
    @friend_request = FriendRequest.new
  end

  # GET /friend_requests/1/edit
  def edit
  end

  # POST /friend_requests or /friend_requests.json
  def create
    
    @friend_request = FriendRequest.create(requestor_id: current_user.id, receiver_id: params[:receiver_id])

    respond_to do |format|
        if @friend_request.save
          format.html { redirect_to user_url(params[:receiver_id]), notice: "Friend request has been sent." }
          format.json { render :show, status: :created, location: @friend_request }
          #Notification.create(recipient: User.find(params[:receiver_id]), actor: current_user, action: 'sent friend request', notifiable: @friend_request)
        else
          format.html { redirect_to user_url(params[:receiver_id]), notice: "Friend request could not be sent." }
          format.json { render json: @friend_request.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /friend_requests/1 or /friend_requests/1.json
  def destroy
    @friend_request.destroy
    respond_to do |format|
      format.html { redirect_to user_url(current_user), notice: "Friend request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_request
      @friend_request = FriendRequest.find(params[:id])
    end

end
