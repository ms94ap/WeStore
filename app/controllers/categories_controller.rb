class CategoriesController < ApplicationController

  def index
   @categories = Category.all
 end

 def show
   @category = Category.find(params[:id])
 end

 def update
   @category = Category.find(params[:id])
    return head(:forbidden) unless current_user.admin?
    @category.update(category_params)
  end

  def destroy
    if current_user.admin
      @category.destroy
      redirect_to "/root"
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
