class IdeasController < ApplicationController
  before_action :require_login
  def index
  	@user = User.find(session[:user_id])
  	@ideas = Idea.all
  end

  def show
  	@user = User.find(session[:user_id])
  	@idea = Idea.find(params[:id])
  end

  def create
  	@user = User.find(session[:user_id])
  	idea = @user.ideas.new(content: params[:content])
  	if idea.valid?
  		idea.save
  		flash[:success] = "Idea successfully posted"
  		redirect_to "/bright_ideas"
  	else
  		flash[:errors] = idea.errors.full_messages
  		redirect_to "/bright_ideas"
  	end
  end

  def destroy
  	@user = User.find(session[:user_id])
  	@idea = Idea.find(params[:id])
  	@idea.delete if @idea.user == current_user
  	redirect_to "/bright_ideas"
  end
end
