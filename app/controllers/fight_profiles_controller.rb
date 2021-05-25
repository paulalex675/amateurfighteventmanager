class FightProfilesController < ApplicationController
  before_action :set_fight_profile, only: %i[ show edit update destroy ]

  # GET /fight_profiles or /fight_profiles.json
  def index
    @fight_profiles = FightProfile.all
  end

  # GET /fight_profiles/1 or /fight_profiles/1.json
  def show
  end

  # GET /fight_profiles/new
  def new
    @fight_profile = FightProfile.new
  end

  # GET /fight_profiles/1/edit
  def edit
  end

  # POST /fight_profiles or /fight_profiles.json
  def create
    @fight_profile = current_user.fight_profiles.build(fight_profile_params)

    respond_to do |format|
      if @fight_profile.save
        format.html { redirect_to @fight_profile, notice: "Fight profile was successfully created." }
        format.json { render :show, status: :created, location: @fight_profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fight_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fight_profiles/1 or /fight_profiles/1.json
  def update
    respond_to do |format|
      if @fight_profile.update(fight_profile_params)
        format.html { redirect_to @fight_profile, notice: "Fight profile was successfully updated." }
        format.json { render :show, status: :ok, location: @fight_profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fight_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fight_profiles/1 or /fight_profiles/1.json
  def destroy
    @fight_profile.destroy
    respond_to do |format|
      format.html { redirect_to fight_profiles_url, notice: "Fight profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight_profile
      @fight_profile = FightProfile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_profile_params
      params.require(:fight_profile).permit(:user_id, :ring_name, :style, :gym_id, :gender, :fight_weight)
    end
end
