class UsersController < ApplicationController
  before_action :require_user

  def show
    @user = User.find(params[:user_id])
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
      flash[:alert] = "Welcome to your Viewing Party!"
    elsif params[:password] != params[:password_confirmation]
      redirect_to '/register'
      flash[:error] = "This user could not be created. Please check your form."
    else
      redirect_to '/register'
      flash[:error] = "This user could not be created. Please check your form."
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
