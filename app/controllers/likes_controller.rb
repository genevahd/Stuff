class LikesController < ApplicationController
  def create
  	user = User.find(session[:user_id])
  	Like.create(user: User.find(session[:user_id]), idea: Idea.find(params[:id]))
  	redirect_to "/bright_ideas"
  end

  def destroy
  	user = User.find(session[:user_id])
  	Like.find_by(idea: Idea.find(params[:id]), user: User.find(session[:user_id])).delete
  	redirect_to "/bright_ideas"
  end 
end
