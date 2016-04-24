class CommentsController < ApplicationController
  before_action :get_comment, only: [:update, :destroy]
  def create
    @comment = current_user.comments.build(comment_params)
    save_for_html_json(@comment, "new") { redirect_to_event }
  end

  def update
    @comment.assign_attributes(comment_params)
    save_for_html_json(@comment, "new") { redirect_to_event }
  end

  def destroy
    destroy_html_json(@comment, redirect_to_event)
  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def redirect_to_event
    campus_room_event_path(params[:comment][:campus_id],
                                  params[:comment][:room_id],
                                  params[:comment][:event_id])
  end


  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end
