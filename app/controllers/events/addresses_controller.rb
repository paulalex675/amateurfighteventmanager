class Events::AddressesController < AddressesController
  before_action :set_hostable
        
  private
      
  def set_hostable
    @hostable = Event.find(params[:event_id])
  end
end