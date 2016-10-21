class UsersController < ApplicationController
 before_action :set_user, only: [:show, :update]
 before_action :check_admin, only: [:delete]

  def new
    @user = User.new
     render json: @user
  
  end

  def show
    @user = User.find(params[:id])
    # respond_to do |format|
    #   format.html {render :show}
    #   format.json {render json: @user}
    # end
      render json: @user
   
  end

  def index
    @users = User.all
    render json: @user
    
  end

  def edit
    @user = User.find(params[:id])
    render json: @user
    
 end

  def create
    @user = User.new(user_params)
    if @user.save
      # redirect_to user_path(@user)
      render json: @user
    else

      # render :new
      render json: {errors: @user.errors.full_messages, status: :uprocessable_entity}
    end
  end

  def update
    @user.update(user_params)
    if @user.save
      # redirect_to user_path(@user)
      render json: @user
    else
      # render :edit
      render json: {errors: @user.errors.full_messages, status: :uprocessable_entity}
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
