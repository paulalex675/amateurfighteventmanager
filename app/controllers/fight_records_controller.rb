class FightRecordsController < ApplicationController
  before_action :set_fight_record, only: %i[ show edit update destroy ]

  # GET /fight_records or /fight_records.json
  def index
    @fight_records = FightRecord.order(:fight_score)
  end

  # GET /fight_records/1 or /fight_records/1.json
  def show
  end

  # GET /fight_records/new
  def new
    @fight_record = FightRecord.new
  end

  # GET /fight_records/1/edit
  def edit

  end

  def calc_score
  end

  # POST /fight_records or /fight_records.json
  def create
    @user = current_user
    @fight_record = @user.fight_records.new(fight_record_params)
    

    respond_to do |format|
      if @fight_record.save
        @fight_record.set_score
        format.html { redirect_to user_path(@fight_record.user), notice: "Fight record was successfully created." }
        format.json { render :show, status: :created, location: @fight_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fight_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fight_records/1 or /fight_records/1.json
  def update
    respond_to do |format|
      if @fight_record.update(fight_record_params)
        @fight_record.set_score
        format.html { redirect_to @fight_record, notice: "Fight record was successfully updated." }
        format.json { render :show, status: :ok, location: @fight_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fight_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fight_records/1 or /fight_records/1.json
  def destroy
    @fight_record.destroy
    respond_to do |format|
      format.html { redirect_to fight_records_url, notice: "Fight record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight_record
      @fight_record = FightRecord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fight_record_params
      params.require(:fight_record).permit(:user_id, :style_id, :win, :draw, :lose, :fight_score)
    end
end
