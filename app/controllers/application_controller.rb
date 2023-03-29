class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  before_action :current_user
  before_action :require_login

  private
    def current_user
      @current_user = User.where(id: session[:user_id]).first
    end

    def require_login
      current_user
      if is_logged?
        puts "require"
        flash[:error] = "You must be logged in to get access"
        redirect_to users_path
      end
    end

    def is_logged?
      current_user == nil
    end
    
    def record_not_found
      render file: 'public/404.html', status: 404
    end
end
