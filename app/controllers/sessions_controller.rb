class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to profile_path(session[:user_id]) 
    end
   
  end 


    def create
       @user = User.find_by(id: params[:user][:user_id])
       if @user.nil?
         flash[:error] = "Sorry, log info was incorrect. Please try again."
       redirect_to '/login'
      elsif
        params[:provider] == 'google_oauth2'
        @user= User.from_omniauth(auth)
        create_session
        redirect_to profile_path(@user.id)
      elsif
        # return head(:forbidden) unless 
        @user.authenticate(params[:user][:password]) 
        create_session
        redirect_to profile_path(@user.id)
      else
        flash[:error] = "Sorry, password was incorrect. Please try again."
        redirect_to '/login'
      end
    end

  


    def destroy
      session.delete(:user_id)
      
      redirect_to '/' 
      flash[:error] = "You have successfully logged out."
    end 

    def omniauth
        @user = User.from_omniauth(auth)
      if @user
        create_session
        # redirect_to profile_path(@user.id)
        flash[:error] = "You have successfully logged in."
        redirect_to '/'
      else 
        redirect_to '/login'
      end 
    end 
    
    private
    
    def auth
        request.env['omniauth.auth']
    end
    
    
end