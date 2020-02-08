class SignupController < ApplicationController
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力した値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:familyname] = user_params[:familyname]
    session[:firstname] = user_params[:firstname]
    session[:familyname_kana] = user_params[:familyname_kana]
    session[:firstname_kana] = user_params[:firstname_kana]
    session[:birthday] = user_params[:birthday]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new # 新規インスタンス作成
  end

  # def step3
  #   session[:cellphone] = user_params[:cellphone]
  #   @user = User.new
  # end

  def create
    @user = User.new(
      email: session[:email], # sessionに保存された値をインスタンスに渡す
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      nickname: session[:nickname],
      familyname: session[:familyname], 
      firstname: session[:firstname], 
      familyname_kana: session[:familyname_kana], 
      firstname_kana: session[:firstname_kana], 
      birthday: session[:birthday],
      cellphone: user_params[:cellphone] # step2で入力した値をインスタンスに渡す
    )
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
      :birthday
    )
  end
end
