class PostsController < ApplicationController

  def index
    if params[:user_id]
      @posts = User.find(params[:user_id]).posts
      # respond_to do |format|
      #   format.html { render :index }
      #   format.json { render json: @posts }
      render json: @posts
      

    else
      @posts = Post.most_recent
      # respond_to do |format|
      #   format.html { render :index }
      #   format.json { render json: @posts }
      render json: @posts
    end
  end

  def show
    @post = Post.find(params[:id])
    # respond_to do |format|
    #   format.html { render :show }
    #   format.json { render json: @post }
    render json: @post
      
    # end
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      # redirect_to new_user_path, alert: "user not found."
      render json: @post
    else
      @post = Post.new(user_id: params[:user_id])
      render json: @post
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    # redirect_to user_post_path(@post), notice: 'Successfully updated.'
    render json: @post
  end

  def edit
    if params[:user_id]
      user = User.find_by(id: params[:user_id])
      if user.nil?
        # redirect_to users_path, alert: "Account not Found"
        render json: @post
      else
        @post = user.posts.find_by(id: params[:id])
        # redirect_to user_post_path(user) if @post.nil?
        render json: @post
      end
    else
      @post = Post.find(params[:id])
      render json: @post
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # redirect_to user_post_path(@post.user, @post)
      render json: @post
    else
      # render 'posts/new', alert: " Please fill in all fields"
      render json: @post
    end
  end


  def destroy    
   @post = Post.find(params[:id])
   @post.destroy
     if current_user.admin?
      # redirect_to root_path
      render json: @post
    else
     # redirect_to user_path(current_user)
     render json: @post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :user_id, product_attributes: [:name, :minimum_quantity, :price, :category])
  end

end
