class CommentsController < ApplicationController
  before_action :get_comment, only: [:create, :update, :destroy]
  def create
    @comment = current_user.comments.build(comment_params)
    save_for_html_json(@comment, "new") { comment_path(@comment) }
  end

  def update
    @comment.assign_attributes(comment_params)
    save_for_html_json(@comment, "new") { comment_path(@comment) }
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
    @comment = Comment.find(params[:id])
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
