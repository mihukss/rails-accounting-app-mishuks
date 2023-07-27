class GoogleloginsController < ApplicationController
  skip_before_action :logged_in?

  def create
    if user = authenticate_with_google
      session[:current_user_id] = user.id
      flash[:success] = ["You are logged in with #{user.email} Google Account"]
      redirect_to users_path
    else
      flash[:danger] = ['Unauthorized user']
      redirect_to login_path
    end
  end

  private

  def authenticate_with_google
    if id_token = flash[:google_sign_in]['id_token']
      pp id_token
      pp "======"
      User.find_by google_id: GoogleSignIn::Identity.new(id_token).user_id
    elsif error = flash[:google_sign_in][:error]
      logger.error "Google authentication error: #{error}"
      nil
    end
  end
end
