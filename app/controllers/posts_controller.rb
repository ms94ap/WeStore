class PostsController < ApplicationController

  def index
    if params[:user_id]
      @posts = User.find(params[:user_id]).posts
    else
      @posts = Post.all
    end
  end

  def show
    if params[:user_id]
      @post = Post.find(params[:id])
    else
      @post = Post.find(params[:id])
    end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to new_user_path, alert: "user not found."
    else
      @post = Post.new(user_id: params[:user_id])
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to user_post_path(@post), notice: 'Successfully updated.'
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        redirect_to users_path, alert: "Account not Found"
      else
        @post = user.posts.find_by(id: params[:id])
        redirect_to user_post_path(user) if @post.nil?
      end
    else
      @post = Post.find(params[:id])
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(@post.user, @post)#add user to redirect to the path
    else
      render 'posts/new', alert: " Please fill in all fields"
    end
  end


  def destroy
   @post = Post.find(params[:id])
   @post.destroy
   redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id, product_attributes: [:name, :minimum_quantity, :price, :category])
  end

end
