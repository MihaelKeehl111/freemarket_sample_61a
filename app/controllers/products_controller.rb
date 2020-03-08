class ProductsController < ApplicationController
  def index
  end

  def show
  end

  def completion
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @product = Product.new
    @product.images.new
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
        # params[:image].each do |image|
        #   @product.images.create(image: image, product_id: @product.id)
        # end  
      redirect_to completion_products_path, {controller: "products", action: "index", name: "completion"} do
    else
      flash.now[:alert] = '必須事項を入力して下さい'
      render :new
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :size, :state_id, :delivery_charge_id, :delivery_method_id, :delivery_area_id, :delivery_date_id, :price, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end
end