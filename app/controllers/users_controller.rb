class UsersController < ApplicationController
 before_action :set_user, only: [:show, :update]
 before_action :validate_user, only: [:edit]
 before_action :check_admin, only: [:delete]


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else

      render :new
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def check_admin
    @user.admin?
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :country)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
