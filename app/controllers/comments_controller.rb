class CommentsController < ApplicationController
  def create
    #Builds the comment for the current user
    #params[:id] should be the id of the Event
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to_event }
        format.json { render json: @comment }
      else
        format.html { redirect_to_event }
        format.json { render json: @comment.errors }
      end
    end
  end

  def update
    ##Not sure how to get the comment id
    @comment = get_comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to_event }
        format.json { render json: @comment }
      else
        format.html { redirect_to_event }
        format.json { render json: @comment.errors }
      end
    end
  end

  def destroy
    @comment = get_comment
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to_event }
        format.json { render json: { message: "Successfully Deleted" } }
      else
        format.html { redirect_to_event }
        format.json { render json: { message: "Failed to Delete" } }
      end
    end
  end

  private
  def get_comment
    ##Not sure how to get the comment id
    Comment.find(params[:comment_id])
  end

  def redirect_to_event
    redirect_to campus_room_event_path(params[:campus_id],
                                  params[:room_id],
                                  params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end
