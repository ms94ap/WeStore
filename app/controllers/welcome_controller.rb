class WelcomeController < ApplicationController

 def index
    @posts = Post.all
    respond_to do |format|
    	format.html { render 'index'}
    	format.json {  render json: @posts }
    end
 end

end
