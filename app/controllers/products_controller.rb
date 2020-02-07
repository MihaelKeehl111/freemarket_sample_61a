class ProductsController < ApplicationController
  def index
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
  end

  def show
  end

end
