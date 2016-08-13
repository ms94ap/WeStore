class CategoriesController < ApplicationController
layout "admin_layout"
 #before_filter to be removed in version 5.1
before_action :check_admin
end

 def index
   @category = Category.find(params[:id])
 end

 def new
   @category = Category.new
 end

 def create
   @category = Category.create(:name)
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

 def delete
   @category = Category.find(params[:id])
   @category.destroy
   redirect_to admin_category_path(@category)
 end

 private
 def check_admin
   if !current_user.admin
     redirect_to root, alert: "Admin rights required!!!"
   end
 end
end
