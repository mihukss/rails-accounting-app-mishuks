class ApplicationController < ActionController::Base
    before_action :logged_in?
    SECRET = "mysecret"

    rescue_from ApplicationPolicy::ActionForbidden, with: :render_403

    def logged_in?
      unless current_user
        redirect_to root_path
        flash[:danger] = ['Unauthorized user'] 
      end
    end

    def render_403
      render 'errors/403'
    end
    
    def current_user
      @current_user ||= User.find_by(id: session[:current_user_id])
    end

    def encode_user_data(payload)
      JWT.encode payload, SECRET, 'HS256'
    end

    def decode_user_data(token)
      begin
        data = JWT.decode token, SECRET, true, { algorithm: 'HS256' }
        return data
      rescue => e
        puts e
      end
    end
end
