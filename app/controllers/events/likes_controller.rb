class Events::LikesController < LikesController
  before_action :set_likeable
      
  private
      
  def set_likeable
    @likeable = Event.find(params[:event_id])
  end
end