class ApplicationController < ActionController::Base
    helper_method :current_user, :current_admin
    protected

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def current_admin
      current_admin = warden.authenticate(scope: :admin)
    end
  
    def authenticate_user!
      redirect_to login_path unless current_user
    end

    def authenticate_admin!
      redirect_to new_admin_session_path unless current_admin
    end

    def check_admin_priv
        if !current_admin
            redirect_to root_path
        end
    end
end
