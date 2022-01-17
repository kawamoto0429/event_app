class CommentsController < ApplicationController
  def create
    p "====="
    p params
    p "====="
    @event = Event.find(params[:event_id])
    @comment = current_user.comments.new(comment_params)
    @comment.event_id = params[:event_id]
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  private

    def comment_params
      # params.require(:comment).permit(:text)
      params.permit(:text)
    end
end
