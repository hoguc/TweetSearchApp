class CommentsController < ApplicationController
  def create
    @like = Like.find(params[:like_id])
    @comment = @like.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render :index
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content, :like_id, :user_id)
  end
end
