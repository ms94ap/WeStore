class CategoriesController < ApplicationController


 def show
   @category = Category.find(params[:id])
 end

 def new
   @category = Category.new
 end

 def create
   @category = Category.create(:name)


 def destroy
   @category = Category.find[params(:id)]
   @category.destroy
   redirect_to "/root"
 end
end
