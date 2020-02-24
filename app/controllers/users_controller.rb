class UsersController < ApplicationController
  def index
  end

  def identification
    @address = Address.find_by(user_id: current_user.id)
    # if @address.update(address_params)
    #   redirect_to users_path
    # else
    #   render :identification
    # end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to users_path
    else
      render :edit
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
      address_attributes: [:id, :postcode, :prefecture, :municipality, :address, :building],
      card_attributes: [:id, :card_number, :expiration_month, :expiration_year, :security_code]
    )
  end

  # def address_params
  #   params.require(:addres).permit(
  #     :postcode, :prefecture, :municipality, :address, :building
  #   )
  # end
end
