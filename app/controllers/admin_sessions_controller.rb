class AdminSessionsController < ApplicationController
    def new
    end
  
    def create
      admin = Admin.find_by(email: params[:email])
      if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to admin_dashboard_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid email or password'
        render :new
      end
    end
  
    def destroy
      reset_session
      redirect_to root_path, notice: 'Logged out successfully'
    end
  end
  