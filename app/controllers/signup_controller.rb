class SignupController < ApplicationController
  before_action :validates_register_user_info, only: :register_cellphone
  before_action :validates_register_cellphone, only: :register_address
  before_action :validates_register_address, only: :register_card
  require "date"
  require "payjp"

  def create
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token(length = 30)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    super
  end

  def register_user_info
    @user = User.new # 新規インスタンス作成
  end

  
  def validates_register_user_info
    if params[:sns_auth] == 'true'
      pass = Devise.friendly_token(length = 30)
      params[:user][:password] = pass
      params[:user][:password_confirmation] = pass
    end
    # binding.pry
    session[:nickname] = user_params[:nickname] #register_user_infoで入力した値をsessionに保存
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      cellphone: 11112222,
      familyname: "sei",
      firstname: "mei",
      familyname_kana: "セイ",
      firstname_kana: "メイ",
      birthday: "2001-01-01"
    )
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render '/signup/register_user_info'
    end
  end

  def register_cellphone
    @user = User.new # 新規インスタンス作成
  end

  def validates_register_cellphone
    session[:cellphone] = user_params[:cellphone] #register_cellphoneで入力した値をsessionに保存
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      cellphone: session[:cellphone],
      familyname: "姓",
      firstname: "名",
      familyname_kana: "セイ",
      firstname_kana: "メイ",
      birthday: "2001-01-01"
    )

    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render '/signup/register_cellphone'
    end
  end

  def register_address
    @user = User.new #新規インスタンス作成
    @user.build_address #addressの入力を記述したビューを呼び出すアクションに記述
  end

  def validates_register_address
    session[:birthday] = Date.new(params[:birthday]["birthday(1i)"].to_i,params[:birthday]["birthday(2i)"].to_i,params[:birthday]["birthday(3i)"].to_i)
    session[:familyname] = user_params[:familyname] #register_addressで入力した値をsessionに保存
    session[:firstname] = user_params[:firstname]
    session[:familyname_kana] = user_params[:familyname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:phone] = user_params[:phone]
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new(
      nickname: session[:nickname], #sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      familyname: session[:familyname],
      familyname_kana: session[:familyname_kana],
      firstname: session[:firstname],
      firstname_kana: session[:firstname_kana],
      cellphone: session[:cellphone],
      phone: session[:phone],
      birthday: session[:birthday]
    )
    @user.build_address(session[:address_attributes])
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render '/signup/register_address'
    end
  end

  def register_card
    @user = User.new
    @user.build_card #cardの入力を記述したビューを呼び出すアクションに記述
  end

  def create
    @user = User.new(
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      nickname: session[:nickname],
      familyname: session[:familyname], 
      firstname: session[:firstname], 
      familyname_kana: session[:familyname_kana], 
      firstname_kana: session[:firstname_kana], 
      birthday: session[:birthday],
      cellphone: session[:cellphone],
      phone: session[:phone]
    )
    @user.build_address(session[:address_attributes])

    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
    else
      render '/signup/register_card'
    end

    Payjp.api_key = ENV["sk_test_13c8abc03b509ed5108985cf"]
    if params['payjpToken'].blank?
      render '/signup/register_card'
    else
      customer = Payjp::Customer.create(
        description: 'test',
        email: current_user.email, 
        card: params['payjp_token']
      )
      @card = Card.new(
        user_id: current_user.id,
        customer_id: customer.id,
        card_id: customer.default_card
      )
    end

    if @card.save
      redirect_to complete_registration_signup_index_path
    else
      flash.now[:alert] = @user.errors.full_messages
      render '/signup/register_card'
    end
  end

  #   Payjp.api_key = 'sk_test_13c8abc03b509ed5108985cf'
  #   if params['payjpToken'].blank?
  #     render '/signup/register_card'
  #   else
  #     customer = Payjp::Customer.create(
  #       description: 'test',
  #       email: @user.email,
  #       card: params[:payjpToken]
  #     )
  #   end

  #   @card = Card.new(user_params[:card_attributes])
  #   @card[:customer_id] = customer.id
  #   @card[:card_id] = customer.default_card

  #   unless @card.valid?
  #     flash.now[:alert] = @card.errors.full_messages
  #     render :register_card and return
  #   end

  #   if @user.save
  #     session[:id] = @user.id
  #     redirect_to complete_registration_signup_index_path
  #   else
  #     flash.now[:alert] = @user.errors.full_messages
  #     render '/signup/register_card'
  #   end
  # end
  
  def complete_registration
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation,
      :nickname,
      :cellphone,
      :familyname,
      :firstname,
      :familyname_kana,
      :firstname_kana,
      :birthday,
      :phone,
      address_attributes: [:id, :postcode, :prefecture, :municipality, :address, :building],
      card_attributes: [:id, :credit_card, :expiration_month, :expiration_year, :security_code, :customer_id, :card_id]
    )
  end
end
