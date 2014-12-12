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

  private

  def user
    @user ||= User.find_by(email: params[:sessions][:email])
  end

  def password
    params[:sessions][:password]
  end

  def landing_page
    #Landlord is 0
    if user.user_type == 0
      #page to view bids
    else
      #page to view available jobs
    end
  end

end
