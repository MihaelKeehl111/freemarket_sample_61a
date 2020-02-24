class UsersController < ApplicationController
  def index
  end

  def identification
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
    params.require(:user).permit(:nickname, :profile)
  end
end
