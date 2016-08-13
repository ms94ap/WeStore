class CategoriesController < ApplicationController


 def show
   @category = Category.find(params[:id])
 end

 def new
   @category = Category.new
   redirect_to '/'
 end


 def destroy
   @category = Category.find[params(:id)]
   @category.destroy
   redirect_to "/root"
 end
end
