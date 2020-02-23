class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @product = Product.new
    @categories = Category.all
    @states = State.all
    @delivery_charges = DeliveryCharge.all
    @delivery_methods = DeliveryMethod.all
    @delivery_areas = DeliveryArea.all
    @delivery_dates = DeliveryDate.all
  end

  def create
    @product = Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :size, :state_id, :delivery_charge_id, :delivery_method_id, :delivery_area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end