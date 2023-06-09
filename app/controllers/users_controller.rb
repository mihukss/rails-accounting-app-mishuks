class UsersController < ApplicationController
  before_action :logged_in?
  # skip_before_action :logged_in?, only: [:new, :create]
  skip_before_action :verify_authenticity_token
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new permitted_params
    user.save!
    if user.save
      token = encode_user_data({ user_data: user.id, email: user.email })
      flash[:success] = ["You have created a user with #{token} token" ]
      redirect_to users_path
    else
      flash[:danger] = ["Error"]
      redirect_to login_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(permitted_params)
    flash[:success] = "User was successfully updated."
  end

  def destroy
    flash[:success] = "User was successfully destroyed."
    @user = User.find(params[:id])
    @user.destroy!
    flash[:success] = "User was successfully destroyed."
    redirect_to users_path
  end
    
  private

  def permitted_params
    params.require(:user).permit(:email, :password, :first_name)
  end
end
