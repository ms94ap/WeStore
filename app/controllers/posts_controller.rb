class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def edit

  end

  def new
    @post = Post.new
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path
  end
  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end

end
