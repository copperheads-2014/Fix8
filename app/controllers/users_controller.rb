class UsersController < ApplicationController
  skip_before_action :require_login
  # Take note that there is a before action in the Application Controller that will set @user to equal the authenticated user.  For the edit and show route we want to be clear about who we are referring to.
  # Thus
  # @user == user that is currently logged in
  # @viewed_user == user from the URL
  before_action :viewed_user, only: [:edit, :show]
  before_action :allowed, only: [:edit]
  before_action :set_skills, only: [:edit]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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

  def update
    if @user.update(user_params)
      redirect_to home_path
    else
      redirect_to edit_user_path
    end
  end

  def show
  end


  private

  def allowed
    unless @user == @viewed_user
      redirect_to home_path
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_type, :address, :name, :phone_number)
  end

  def viewed_user
    @viewed_user = User.find(params[:id])
  end

  def contractor?
    @user.user_type == 'contractor'
  end

  def set_skills
    @skills = Skill.all
  end

end
