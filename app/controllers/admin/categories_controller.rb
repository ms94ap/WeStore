class Admin::CategoriesController < ApplicationController
layout "admin_layout"

 def index
   @category = Category.find(params[:id])
 end

 def new
   @category = Category.new
 end

 def create
   @category = Category.create(:name)
   if @category.save
     redirect_to admin_category_path(@category)
   end
 end

 def edit
   @category = Category.find(params[:id])
    if @category.update(name: params[:name])
      redirect_to admin_category_path(@category), notice: "Category updated."
    else
      render :edit
    end
  end

 def delete
   @category = Category.find[params(:id)]
   @category.destroy
   redirect_to admin_category_path(@category)
 end


end
