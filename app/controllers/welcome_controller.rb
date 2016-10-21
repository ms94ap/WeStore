class WelcomeController < ApplicationController

 def index
    @posts = Post.most_recent
    respond_to do |format|
    	format.html { render 'index'}
    	format.json {  render json: @posts }
    end
 end

end
