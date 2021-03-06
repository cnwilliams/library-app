class UsersController < ApplicationController

  # before_action :require_login?, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to @user
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  # def require_login?
  #   current_user == @user
  # end


  # def logged_in?
  #   !current_user.nil?
  # end

end
