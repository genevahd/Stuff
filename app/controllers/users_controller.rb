class UsersController < ApplicationController
  before_action :require_login, except: [:create]
  # before_action :require_correct_user, only: [:edit, :destroy]
  def create
    user = User.new(name: params[:name], alias: params[:alias], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/bright_ideas"
    else
      flash[:errors] = user.errors.full_messages
      session[:user_id] = nil
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end
end
