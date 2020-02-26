class UsersController < ApplicationController
  def index
  end

  def identification
    @address = Address.find_by(user_id: current_user.id)
  end

  def change_password
  end

  def check_cellphone
  end

  def change_address
    @address = Address.find_by(user_id: current_user.id)
  end

  def card
    @card = Card.find_by(user_id: current_user.id)
    card_number = @card.card_number.to_i
    last_4_number = card_number % 10000
    @last_4_number = last_4_number.to_s
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      # @user = User.find_by(id: current_user)
      # flash.now[:alert] = @user.errors.full_messages
      return
    end
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
      :profile,
      address_attributes: [:id, :postcode, :prefecture, :municipality, :address, :building],
      card_attributes: [:id, :card_number, :expiration_month, :expiration_year, :security_code]
    )
  end
end
