class CommentsController < ApplicationController
  include ApplicationHelper

  def create
    @comment = Comment.new comment_params
    respond_to do |format|
      if @comment.save
        format.json {render json: {comment: @comment, user: current_user} }
      else
        format.json {render json: {status: t("error")}}
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :product_id).merge! user_id:
        current_user.id
    end
end
