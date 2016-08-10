class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :show_errors

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
   @product = Product.where(name: product_params[:name].downcase).first_or_create
   if @product.save
     redirect_to product_path(@product)
   else
     render :new
   end
 end

 private

 def show_errors
   flash[:error] = "Please add a product."
   redirect_to products_path
 end

 def product_params
   params.require(:product).permit(:name)
 end
end
