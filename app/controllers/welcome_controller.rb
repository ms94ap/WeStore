class WelcomeController < ApplicationController

 def index
    @posts = Post.most_recent
    render json: @posts
 end

end
