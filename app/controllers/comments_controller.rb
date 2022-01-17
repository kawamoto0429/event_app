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
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:id])
    @reply = Reply.new
    @replies = Reply.where(event_id: params[:event_id], comment_id: params[:id])
  end
  
  def reply
    p "====="
    p params
    p "====="
    @event = Event.find(params[:event_id])
    @comment = Comment.find(params[:comment_id])
    @reply = current_user.replies.new(reply_params)
    p "====="
    p @reply
    p "====="
    @reply.event_id = params[:event_id]
    @reply.comment_id = params[:comment_id]
    
    
    if @reply.save
      flash[:success] = "Reply created!"
      redirect_to event_comment_path(@event, @comment)
    else
      render 'new'
    end
  end
  
  private

    def comment_params
      # params.require(:comment).permit(:text)
      params.permit(:text)
    end
    
    def reply_params
      params.require(:reply).permit(:content)
    end
end
