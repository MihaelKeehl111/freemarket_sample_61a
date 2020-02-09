class SignupController < ApplicationController
  before_action :validates_step1, only: :step2
  before_action :validates_step2, only: :step3
  before_action :validates_step3, only: :step4

  def step1 #step2のビューを呼び出すアクション
    @user = User.new # 新規インスタンス作成
  end

  def validates_step1
    session[:nickname] = user_params[:nickname] #step1で入力した値をsessionに保存
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    render '/signup/step1' unless @user.valid?(:validates_step1)
  end

  def step2 #step3のビューを呼び出すアクション
    @user = User.new # 新規インスタンス作成
  end

  def validates_step2
    session[:cellphone] = user_params[:cellphone] #step2で入力した値をsessionに保存
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      cellphone: session[:cellphone]
    )
    render '/signup/step2' unless @user.valid?(:validates_step2)
  end

  def step3 #step4のビューを呼び出すアクション
    @user = User.new #新規インスタンス作成
    @user.build_address #addressの入力を記述したビューを呼び出すアクションに記述
  end

  def validates_step3
    session[:familyname] = user_params[:familyname] #step3で入力した値をsessionに保存
    session[:firstname] = user_params[:firstname]
    session[:familyname_kana] = user_params[:familyname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:phone] = user_params[:phone]
    session[:birthday] = user_params[:birthday]
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
    render '/signup/step3' unless @user.valid?(:validates_step3)
  end

  def step4
    @user = User.new #新規インスタンス作成
    @user.build_card #cardの入力を記述したビューを呼び出すアクションに記述
  end

  def create
    @user = User.new(
      email: session[:email], #sessionに保存された値をインスタンスに渡す
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
    @user.build_card(user_params[:card_attributes])
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
  end
  
  def done
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
      card_attributes: [:id, :card_number, :expiration_month, :expiration_year, :security_code]
    )
  end
end
