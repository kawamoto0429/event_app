class EventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :destroy]
  
  def index
    @events = Event.all();
    @genres = Genre.all();
  end
  
  def genre
    p "======"
    p params
    p "======"
    
    @genres = Genre.all();
    @events = Event.where(genre_id: params[:genre_id])
    
    # redirect_to genre_path(@events)
  end
  
  def show
    @event = Event.find(params[:id])
    @comments = Comment.all()
  end
  
  def new
    # @event = Event.new
    @event = current_user.events.build if logged_in?
    @genres = Genre.all();
  end

  def create
    p "======"
    p params
    p "======"
    
    @genres = Genre.all();
    @event = current_user.events.new(event_params)
    @event.genre_id = params[:genre_id]
    if @event.save
      flash[:success] = "Micropost created!"
      redirect_to events_path
      
    else
      
      render 'new'
    end
  end

  def destroy
  end

  private

    def event_params
      params.require(:event).permit(:title, :body)
    end
end
