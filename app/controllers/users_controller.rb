class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    
    @user = User.new(user_params)
    if @user.save
      UserJob.perform_later(@user)
      sign_in @user
      redirect_back_or sign_in_path
    else
      render template: "users/new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render '/users/edit'
    end
  end

private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :gender, :city, :zipcode, :state, :country, :phone_number, :birthdate, :address, :avatar)
  end
end
