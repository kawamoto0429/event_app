class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :destroy]
  
  def index
    @events = Event.all();
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    # @event = Event.new
    @event = current_user.events.build if logged_in?
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = "Micropost created!"
      redirect_to events_path
      
    else
      render :new
    end
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:title, :body)
    end
end
