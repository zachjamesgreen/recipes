class CommentController < ApplicationController

  def show
  end

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.save
  end

  def delete
  end



  private

  def comment_params
    params.require(:comment).permit(:recipe_id, :rating, :comment)
  end




end
