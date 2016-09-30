class CommentsController < ApplicationController

  def index 
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    render 'comments/show'
  end

  private

  def comments_params
    params.require(:comment).permit(:content, :commenter, :user_id, :post_id, :time_created)
  end

end