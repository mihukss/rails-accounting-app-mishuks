class Auth::LoginsController < ApplicationController
  skip_before_action :logged_in?

  def new; end
  
  def create
    user = User.find_by(email: permitted_params[:email])
    if user && user.password == permitted_params[:password]
      session[:current_user_id] = user.id
      token = encode_user_data({ user_data: user.id, email: user.email })
      flash[:success] = ["You are logged in with '#{token}' token" ]
      redirect_to users_path
    else
      flash[:danger] = ["Unauthorized user" ]
      redirect_to login_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to login_path
    flash[:info] = ['You have successfully been logged out']
  end
  
  private

  def permitted_params
    params.require(:user).permit(:email, :password)
  end
end
