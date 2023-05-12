class UsersController < ApplicationController 
    
    def index
      @users = User.all
    end

    def new
      @user = User.new
    end

    def create
      user = User.new permitted_params
      user.save!
    end

    def edit
      @user = User.find(params[:id])
    end
    
    def update
      @user = User.find(params[:id])
      @user.update!(permitted_params)
    end

    private

    def permitted_params
      params.require(:user).permit(:email, :password, :first_name)
    end
end