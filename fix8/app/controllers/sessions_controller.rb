class SessionsController < ApplicationController
  def new
  end

  def create
    user
    if user.save && user.authenticate(password)
     session[:user_id] = user.id
     redirect_to landing_page
    else
      render :new
    end
  end

  private

  def user
    @user ||= User.find_by(email: params[:sessions][:email])
  end

  def password
    params.require(:sessions).permit(:password)
  end

  def landing_page
    #Landlord is 0
    if user.user_type == 0
      #page to view bids
    else
      #page to view available jobs
    end
    #If they are a landlord, send them to their landing page
    #Else send them to the Contractor page
  end

end
