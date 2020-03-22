class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment: comment_params[:comment], user_id: current_user.id, product_id: comment_params[:product_id])
    redirect_to product_path(comment.product.id)
  end

  def destroy
    comment = Comment.find_by(id: params[:id], product_id: params[:product_id])
    comment.destroy if comment.user_id == current_user.id
    if comment.destroy
      redirect_to product_path(comment.product_id)
    else
      redirect_to product_path(comment.product_id)
    end
  end

  private

  def comment_params
    params.permit(:comment, :product_id)
  end
end
