class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]

  # GET /friendships or /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1 or /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # POST /friendships or /friendships.json
  def create
    @friend_request = FriendRequest.find(params[:friend_request_id])
    @friendship = Friendship.new(user_a_id: @friend_request.requestor_id, user_b_id: @friend_request.receiver_id)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: "Friendship was successfully created." }
        format.json { render :show, status: :created, location: @friendship }
        @friend_request.destroy
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to users_path(current_user), notice: "Friendship was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end
end
