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
            flash[:alert] = "Musisz być zalogowany, aby wykonać tą akcję."
            redirect_to login_path
        end
    end

    def require_admin
        if !logged_in? || !admin?
            flash[:alert] = "Musisz mieć uprawnienia administatora, aby wykonać tą akcję."
            redirect_to login_path
        end
    end
end
