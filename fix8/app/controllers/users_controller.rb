class UsersController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_type = params[:user_type]
    if @user.save
      session[:user_id] = @user.id
       #Change the redirect to the proper page
       redirect_to home_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type, :address, :name, :phone_number)
  end

end
