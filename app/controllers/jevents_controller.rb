class JeventsController < ApplicationController
  def create
    p "---------"
    p params
    p "---------"
    
    @jevent = current_user.jevents.create(event_id: params[:event_id])
    
    @event = Event.find_by(id: params[:event_id])
    redirect_to event_path(@event)
  end
  
  def destroy
    p "---------"
    p params
    p "---------"
    
    @event = Event.find_by(id: params[:event_id])
    
    @jevent = Jevent.find_by(event_id: params[:event_id], user_id: current_user.id)
    @jevent.destroy
    redirect_to event_path(@event)
  end
  


end
