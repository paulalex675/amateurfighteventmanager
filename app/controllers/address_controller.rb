class AddressController < ApplicationController
  before_action :set_address, only: %i[ show edit update destroy ]

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = gym.addresses.build(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address.gym, notice: "Address was saved!" }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @addressable, notice: "address was successfully updated." }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to @addressable, notice: "address was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:address1, :address2, :town_or_city, :county, :post_code, :country)
    end
    
end
