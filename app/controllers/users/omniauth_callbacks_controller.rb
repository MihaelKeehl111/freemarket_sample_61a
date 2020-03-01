# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  # ファーストトライ

  def facebook
    authorization
  end
  # binding.pry

  def google_oauth2
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]
    # @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      # 登録済みならログイン処理へ
      sign_in_and_redirect @user, event: :authentication
    else
      # 未登録なので新規登録画面へ
      # render template: 'devise/registrations/new'
      # render template: 'signup/index'
      @sns_id = sns_info[:sns].id
      render template: 'signup/register_user_info.html.haml'
      # redirect_to new_user_registration_url
    end
  end


end
