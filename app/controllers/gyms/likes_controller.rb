class Gyms::LikesController < LikesController
  before_action :set_likeable
    
  private
    
  def set_likeable
    @likeable = Gym.find(params[:gym_id])
  end
end