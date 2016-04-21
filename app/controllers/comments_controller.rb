class CommentsController < ApplicationController
  def create
    #Builds the comment for the current user
    #params[:id] should be the id of the Event
    @comment = current_user.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to campus_room_event(params[:campus_id],
                                      params[:room_id],
                                      params[:id]) }
        format.json { render json: @comment }
      else
        format.html { redirect_to campus_room_event(params[:campus_id],
                                      params[:room_id],
                                      params[:id]) }
        format.json { render json: @comment.errors }
      end
    end
  end

  def update
    @comment = Comment.find(get_comment)
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to campus_room_event(params[:campus_id],
                                      params[:room_id],
                                      params[:id]) }
        format.json { render json: @comment }
      else
        format.html { redirect_to campus_room_event(params[:campus_id],
                                      params[:room_id],
                                      params[:id]) }
        format.json { render json: @comment.errors }
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end
