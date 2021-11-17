class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user, :create_session

    private

    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end
  
    def logged_in?
      !!current_user
      # session[:user_id] ? true : false
    end
  
    def authorized
      redirect_to '/' unless logged_in?
      flash[:notice] = "You must be logged in!"
    end

    def unauthorized_user
      # @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
      redirect_to '/'
      flash[:notice] = "You are not authorized to edit this!!"
    end

    def create_session
      session[:user_id] = @user.id
    end

    def move
      @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
    end
    
end