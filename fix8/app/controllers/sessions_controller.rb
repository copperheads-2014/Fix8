class SessionsController < ApplicationController
  def new
  end

  def create
    user
    if user && user.authenticate(password)
     session[:user_id] = user.id
     redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end

  private

  def user
    @user ||= User.find_by(email: params[:sessions][:email])
  end

  def password
    params[:sessions][:password]
  end

end
