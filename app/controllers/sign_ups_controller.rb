class SignUpsController < ApplicationController
  before_action :set_sign_up, only: %i[ show edit update destroy]

  def index 
    @sign_ups = SignUp.all  
  end

  def new
    @sign_up = SignUp.new(params)
  end

  def create
    @sign_up = @sign_upable.sign_ups.build(user_id: current_user.id)

    respond_to do |format|
        if @sign_up.save
          format.html { redirect_to @sign_upable, notice: "You've signed up to this event. Good Luck!" }
          format.json { render :show, status: :created, location: @sign_up }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @sign_up.errors, status: :unprocessable_entity }
        end
      end
  end

  def destroy
    @event = Event.find(@sign_up.event_id)
    @sign_up.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: "You will no longer compete in this event!" }
      format.json { head :no_content }
    end
  end

  private

  def set_sign_up
    @sign_up = SignUp.find(params[:id])
  end
end
