class JcirclesController < ApplicationController
  def create
    p "---------"
    p params
    p "---------"
    
    @jcircle = current_user.jcircles.create(circle_id: params[:circle_id])
    
    @circle = Circle.find_by(id: params[:circle_id])
    redirect_to circle_path(@circle)
  end
  
  def destroy
    p "---------"
    p params
    p "---------"
    
    @circle = Circle.find_by(id: params[:circle_id])
    
    @jcircle = Jcircle.find_by(circle_id: params[:circle_id], user_id: current_user.id)
    @jcircle.destroy
    redirect_to circle_path(@circle)
  end
  
end
