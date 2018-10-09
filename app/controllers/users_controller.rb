class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_back_or sign_in_path
    else
      render template: "users/new"
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :gender, :city, :zipcode, :state, :country, :phone_number, :birthdate, :address)
  end
end
