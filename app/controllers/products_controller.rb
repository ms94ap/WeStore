class ProductsController < ApplicationController

 def show
   @product = Product.find(params[:id])
 end

 def index
   @products = Product.all
 end

 def new
   @product = Product.new
 end

 def create
     category = Category.find_or_create_by(name: params[:category_name])
     Product.create(product_params, category: category)
   else
     render :new
   end
 end

 private
 
 def product_params
   params.require(:product).permit(:category, :name, :minimum_quantity, :price)
 end
end
