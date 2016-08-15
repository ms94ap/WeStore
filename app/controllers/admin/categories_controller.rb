class Admin::CategoriesController < ApplicationController
  layout "admin_layout"
  before_action :check_admin

  def index
   @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
   @category = Category.new
  end

  def create
   @category = Category.create(category_params)
   if @category.save
     redirect_to admin_category_path(@category), notice: "#{@category.name} category created"
   end
 end

  def edit
    @category = Category.find(params[:id])
    if @category.update(name: params[:name])
      redirect_to admin_category_path(@category), notice: "#{@category.name} category updated."
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  private
  
  def check_admin
   if !current_user.admin
     redirect_to root, alert: "Admin rights required!!!"
   end
  end

  def category_params
    params.require(:category).permit(:name)
  end


end
