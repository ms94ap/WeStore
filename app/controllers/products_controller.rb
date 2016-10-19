class ProductsController < ApplicationController

 def show
   @product = Product.find(params[:id])
   	render json: @product
   end
 end

 def index
   @products = Product.all
   render json: @products
 end

 def new
   @product = Product.new
   render json: @product
 end

 def create
     category = Category.find_or_create_by(name: params[:category_name])
     new_product = Product.create(product_params, category: category)
     render json: category, new_product
   else
     render json: category, new_product
   end
 end

 private
 
 def product_params
   params.require(:product).permit(:category, :name, :minimum_quantity, :price)
 end
end
