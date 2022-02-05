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
    
    @genre_id = params[:genre_id]
    
    @genre = Genre.find(params[:genre_id]);
    @genres = Genre.all();
    @events = Event.where(genre_id: params[:genre_id])
    
    # redirect_to genre_path(@events)
  end
  
  def show
    @event = Event.find(params[:id])
    @comments = Comment.where(event_id: params[:id])
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
      @jevent = current_user.jevents.create(event_id: @event.id)
      flash[:success] = "Event created!"
      redirect_to events_path
      
    else
      
      render 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @genres = Genre.all()
  end
  
  def update
     @event = Event.find(params[:id])
      if @event.update(event_params)
        flash[:success] = "更新しました!"
        redirect_to event_path(@event)
      else
         @genres = Genre.all()
         render 'new'
      end
  end

  def destroy
    @user = current_user
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to user_path(@user)
  end

  private

    def event_params
      params.require(:event).permit(:title, :body, :address, :hold)
    end
end
