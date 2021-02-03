class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :admin?

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]     
    end

    def logged_in?
        !!current_user
    end

    def admin? 
        current_user.role == "admin"
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perfom that action"
            redirect_to login_path
        end
    end

    def require_admin
        if !logged_in? || !admin?
            flash[:alert] = "You must be logged in as admin to perfom that action"
            redirect_to login_path
        end
    end
end
