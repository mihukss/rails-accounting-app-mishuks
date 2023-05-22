class ApplicationController < ActionController::Base
    before_action :logged_in?

    def logged_in?
      unless current_user
        redirect_to root_path
        flash[:danger] = ['Unauthorized user'] 
      end
    end
    
    def current_user
      User.find_by(id: session[:current_user_id])
    end
end
