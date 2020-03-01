class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def completion
  end

  def exhibiting
    @products = current_user.products
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
    @product = Product.new(product_params)
    if @product.save
      redirect_to completion_products_path, {controller: "products", action: "index", name: "completion"} do
    else
      flash.now[:alert] = '必須事項を入力して下さい'
      render :new
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :size, :state_id, :delivery_charge_id, :delivery_method_id, :delivery_area_id, :delivery_date_id, :price).merge(user_id: current_user.id, status_id: 1)
  end
end