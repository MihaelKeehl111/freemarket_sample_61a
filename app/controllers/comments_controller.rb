class CommentsController < ApplicationController
  def create
    comment = current_user.comments.new(comment_params)
    if comment.save
      redirect_to product_path(comment.product.id)
    else
      redirect_to product_path(comment_params[:product_id])
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy if comment.user_id == current_user.id
    redirect_to product_path(comment.product_id)
  end

  private

  def comment_params
    params.permit(:comment, :product_id)
  end
end
