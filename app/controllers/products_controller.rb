class ProductsController < ApplicationController
  before_action :set_category, :category_ranking, only: :index
  before_action :set_current_user_products, only: [:exhibiting, :trading, :sold, :purchase, :purchased]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_product_information, only: [:new, :edit, :update]

  def index
    @products = Product.order('created_at DESC')
    @products_ladies_index = @products_ladies.order('created_at DESC').limit(10)
    @products_mens_index = @products_mens.order('created_at DESC').limit(10)
    @products_electronics_index = @products_electronics.order('created_at DESC').limit(10)
    @products_toys_index = @products_toys.order('created_at DESC').limit(10)
  end

  def show
    user = @product.user_id
    @user_products = Product.where(user_id: @product.user_id)
    @category_products = Product.where(category_id: @product.category_id)
    if Product.find_by(id: (params[:id].to_i - 1).to_s) != nil
      @previous_product = Product.find((params[:id].to_i - 1).to_s)
    end
    if Product.find_by(id: (params[:id].to_i + 1).to_s) != nil
      @next_product = Product.find_by(id: (params[:id].to_i + 1).to_s)
    end
  end

  def completion
  end

  def exhibiting
  end

  def trading
  end

  def sold
  end

  def purchase
  end

  def purchased
  end

  def stop_selling
    @product = Product.find(params[:id])
    @product.status_id = params[:status_id]
    @product.save
    redirect_to product_path(@product)
  end

  def reselling
    @product = Product.find(params[:id])
    @product.status_id = params[:status_id]
    @product.save
    redirect_to product_path(@product)
  def destroy
    @product.destroy if @product.user_id == current_user.id
    if @product.destroy
      render :exhibiting
    else
      render :show
    end
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @product = Product.new
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

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      flash.now[:alert] = '必須事項を入力して下さい'
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :description, :category_id, :size, :state_id, :delivery_charge_id, :delivery_method_id, :delivery_area_id, :delivery_date_id, :price).merge(user_id: current_user.id, status_id: 1)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_current_user_products
    @products = current_user.products
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_product_information
    @categories = Category.all
    @states = State.all
    @delivery_charges = DeliveryCharge.all
    @delivery_methods = DeliveryMethod.all
    @delivery_areas = DeliveryArea.all
    @delivery_dates = DeliveryDate.all
  end

  def set_category
    @categories_main = Category.roots.limit(4)

    ladies = Category.find_by name: "レディース"
    if ladies
      @ladies_ids = Category.descendants_of ladies
      @products_ladies = Product.where(category_id: @ladies_ids)
    end

    mens = Category.find_by name: "メンズ"
    if mens
      @mens_ids = Category.descendants_of mens
      @products_mens = Product.where(category_id: @mens_ids)
    end

    kids = Category.find_by name: "ベビー・キッズ"
    if kids
      @kids_ids = Category.descendants_of kids
      @products_kids = Product.where(category_id: @kids_ids)
    end

    interia = Category.find_by name: "インテリア・住まい・小物"
    if interia
      @interia_ids = Category.descendants_of interia
      @products_interia = Product.where(category_id: @interia_ids)
    end

    books = Category.find_by name: "本・音楽・ゲーム"
    if books
      @books_ids = Category.descendants_of books
      @products_books = Product.where(category_id: @books_ids)
    end

    toys = Category.find_by name: "おもちゃ・ホビー・グッズ"
    if toys
      @toys_ids = Category.descendants_of toys
      @products_toys = Product.where(category_id: @toys_ids)
    end
    
    beauties = Category.find_by name: "コスメ・香水・美容"
    if beauties
      @beauties_ids = Category.descendants_of beauties
      @products_beauties = Product.where(category_id: @beauties_ids)
    end
   
    electronics = Category.find_by name: "家電・スマホ・カメラ"
    if electronics
      @electronics_ids = Category.descendants_of electronics
      @products_electronics = Product.where(category_id: @electronics_ids)
    end

    sports = Category.find_by name: "スポーツ・レジャー"
    if sports
      @sports_ids = Category.descendants_of sports
      @products_sports = Product.where(category_id: @sports_ids)
    end

    handmade = Category.find_by name: "ハンドメイド"
    if handmade
      @handmade_ids = Category.descendants_of handmade
      @products_handmade = Product.where(category_id: @handmade_ids)
    end

    tickets = Category.find_by name: "チケット"
    if tickets
      @tickets_ids = Category.descendants_of tickets
      @products_tickets = Product.where(category_id: @tickets_ids)
    end

    bicycles = Category.find_by name: "自転車・オートバイ"
    if bicycles
      @bicycles_ids = Category.descendants_of bicycles
      @products_bicycles = Product.where(category_id: @bicycles_ids)
    end
    
    others = Category.find_by name: "その他"
    if others
      @others_ids = Category.descendants_of others
      @products_others = Product.where(category_id: @others_ids)
    end
  end

  def category_ranking
    @ranking = [@products_ladies, @products_mens, @products_kids, @products_interia, @products_books, @products_toys, @products_beauties, @products_electronics, @products_sports, @products_handmade, @products_tickets, @products_bicycles, @products_others]
    @ranking = @ranking.compact
    @ranking.sort_by {|array| array.length}

    @first_category = Category.find_by(id: @ranking[0][0].category_id) unless @ranking[0][0].nil?
    @second_category = Category.find_by(id: @ranking[1][0].category_id) unless @ranking[1][0].nil?
    @third_category = Category.find_by(id: @ranking[2][0].category_id) unless @ranking[2][0].nil?
    @fourth_category = Category.find_by(id: @ranking[3][0].category_id) unless @ranking[3][0].nil?
  end
end