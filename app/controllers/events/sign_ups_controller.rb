class Events::SignUpsController < SignUpsController
  before_action :set_sign_upable
        
  private
        
  def set_sign_upable
    @sign_upable = Event.find(params[:event_id])
  end
end