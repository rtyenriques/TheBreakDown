class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorized
      redirect_to '/' unless logged_in?
    end

    def unauthorized_user
      flash[:notice] = "!!!You are not authorized to edit this!!"
    end
end