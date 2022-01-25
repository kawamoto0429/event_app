class CirclesController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :destroy]
  
  def index
    @circles = Circle.all();
  end
  
  def show
    @circle = Circle.find(params[:id])
  end
  
  def new
    # @event = Event.new
    @circle = current_user.circles.build if logged_in?
  end

  def create
    @circle = current_user.circles.new(circle_params)
    if @circle.save
      flash[:success] = "Micropost created!"
      redirect_to circles_path
      
    else
      render 'new'
    end
  end
  
  def edit
    @circle = Circle.find(params[:id])
  end
  
  def update
    @circle = Circle.find(params[:id])
      if @circle.update(circle_params)
        flash[:success] = "更新しました!"
        redirect_to circle_path(@circle)
      else
         render 'new'
      end
  end

  def destroy
  end

  private

    def circle_params
      params.require(:circle).permit(:name, :body)
    end

end
