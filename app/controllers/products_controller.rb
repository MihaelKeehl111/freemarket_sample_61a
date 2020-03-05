class ProductsController < ApplicationController
  before_action :set_category, only: :index

  def index
    @products = Product.order('created_at DESC')
    @products_ladies = Product.where(category_id: @ladies_ids).order('created_at DESC').limit(10)
    @products_mens = Product.where(category_id: @mens_ids).order('created_at DESC').limit(10)
    @products_electronics = Product.where(category_id: @electronics_ids).order('created_at DESC').limit(10)
    @products_toys = Product.where(category_id: @toys_ids).order('created_at DESC').limit(10)
  end

  def show
    @product = Product.find(params[:id])
    user = @product.user_id
    @user_products = Product.where(user_id: user)
    @category_products = Product.where(category_id: @product.category_id)
  end

  def completion
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
    params.require(:product).permit(:image, :name, :description, :category_id, :size, :state_id, :delivery_charge_id, :delivery_method_id, :delivery_area_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_category
    @categories_main = Category.roots.limit(4)

    ladies = Category.find_by name: "レディース"
    if ladies
      @ladies_ids = Category.descendants_of ladies
    end

    mens = Category.find_by name: "メンズ"
    if mens
      @mens_ids = Category.descendants_of mens
    end

    kids = Category.find_by name: "ベビー・キッズ"
    if kids
      @kids_ids = Category.descendants_of kids
    end

    interia = Category.find_by name: "インテリア・住まい・小物"
    if interia
      @interia_ids = Category.descendants_of interia
    end

    books = Category.find_by name: "本・音楽・ゲーム"
    if books
      @books_ids = Category.descendants_of books
    end

    toys = Category.find_by name: "おもちゃ・ホビー・グッズ"
    if toys
      @toys_ids = Category.descendants_of toys
    end
    
    beauties = Category.find_by name: "コスメ・香水・美容"
    if beauties
      @beauties_ids = Category.descendants_of beauties
    end
   
    electronics = Category.find_by name: "家電・スマホ・カメラ"
    if electronics
      @electronics_ids = Category.descendants_of electronics
    end

    sports = Category.find_by name: "スポーツ・レジャー"
    if sports
      @sports_ids = Category.descendants_of sports
    end
  end
end