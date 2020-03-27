class LikesController < ApplicationController
  before_action :set_variables

  # def create
  #   # Like.create(user_id: params[:user_id], product_id: params[:product_id])
  #   @like = current_user.likes.create(product_id: params[:product_id])
  #   # render 'products/create.js.erb'
  #   redirect_back(fallback_location: root_path)
  # end


  # def destroy
  #   @like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
  #   @like.destroy
  #   redirect_back(fallback_location: root_path)
  # end

  # セカンドトライ


  def create
    @like = Like.create(user_id: current_user.id, product_id: params[:product_id])
    @likes = Like.where(product_id: params[:product_id])
    @product = Product.all
    render 'create.js.erb'
    
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
    like.destroy
    @likes = Like.where(oroduct_id: params[:product_id])
    @product = Product.all
    render 'destroy.js.erb'
  end






  # 非同期で追記
  private

  def set_variables
    @product = Product.find(params[:product_id])
    @id_name = "#like-link-#{@product.id}"
    
  end

end