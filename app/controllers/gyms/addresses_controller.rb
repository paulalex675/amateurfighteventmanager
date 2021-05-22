class Gyms::AddressesController < AddressesController
  before_action :set_hostable
      
  private
      
  def set_hostable
    @hostable = Gym.find(params[:gym_id])
  end
end