class FightsController < ApplicationController
  before_action :set_fight, only: %i[ show edit update destroy ]

  # GET /fights or /fights.json
  def index
    @fights = Fight.all
  end

  # GET /fights/1 or /fights/1.json
  def show
  end

  # GET /fights/new
  def new
    @fight = Fight.new
  end

  # GET /fights/1/edit
  def edit
  end

  # POST /fights or /fights.json
  def create
    @event = Event.find(params[:event_id])
    @fight = @event.fights.new(fight_params)

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @event, notice: "Fight was successfully created." }
        format.json { render :show, status: :created, location: @fight }
        @fight.fighter_a.user.sign_ups.where(event_id: @fight.event.id).update(matched?: true)
        @fight.fighter_b.user.sign_ups.where(event_id: @fight.event.id).update(matched?: true)
        unless @fight.fighter_a.user.fight_records.where(style_id: @fight.style_id).exists?
          @fight.fighter_a.user.fight_records.create(style_id: @fight.style_id)
        end
        unless @fight.fighter_b.user.fight_records.where(style_id: @fight.style_id).exists?
          @fight.fighter_b.user.fight_records.create(style_id: @fight.style_id)
        end        
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fights/1 or /fights/1.json
  def update
    respond_to do |format|
      if @fight.update(fight_params)
        if @fight.draw
          @fight.fighter_a.user.fight_records.where(style_id: @fight.style_id).each { |r| r.add_draw }
          @fight.fighter_a.user.fight_records.where(style_id: @fight.style_id).each { |r| r.add_draw }
        elsif @fight.winner_id == @fight.fighter_a_id
          @fight.fighter_a.user.fight_records.where(style_id: @fight.style_id).each { |r| r.add_win }
          @fight.fighter_b.user.fight_records.where(style_id: @fight.style_id).each { |r| r.add_loss }
        elsif @fight.winner_id == @fight.fighter_b_id
          @fight.fighter_b.user.fight_records.where(style_id: @fight.style_id).each { |r| r.add_win }
          @fight.fighter_a.user.fight_records.where(style_id: @fight.style_id).each { |r| r.add_loss }
        else
        end
        format.html { redirect_to @fight.event, notice: "Fight was successfully updated." }
        format.json { render :show, status: :ok, location: @fight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fights/1 or /fights/1.json
  def destroy
    @fight.destroy
    respond_to do |format|
      format.html { redirect_to @event, notice: "Fight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_params
      params.require(:fight).permit(:fighter_a_id, :fighter_b_id, :style_id, :weight, :result, :draw, :winner_id, :info, :event_id)
    end
end
