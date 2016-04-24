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
    destroy_html_json(@comment, redirect_to_event)

  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def redirect_to_event
    campus_room_event_path(params[:campus_id],
                                  params[:room_id],
                                  params[:id])
  end


  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end
end
