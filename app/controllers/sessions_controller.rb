class SessionsController < ApplicationController
  def new
  	#reset_session
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id 
  		redirect_to "/bright_ideas"
  	else
  		flash[:error] = "Invalid Combination"
  		redirect_to "/"
  	end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to "/"
  end
end
