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
      else
       
        return head(:forbidden) unless 
        @user.authenticate(params[:user][:password]) 
        create_session
        redirect_to profile_path(@user.id)
      end
    end

  


    def destroy
      session.delete(:user_id)
      flash[:notice] = "You have successfully logged out."
      redirect_to '/' 
    end 

    def omniauth
        @user = User.from_omniauth(auth)
        # byebug
      if @user
        create_session
        # redirect_to profile_path(@user.id)
        flash[:notice] = "You have successfully logged in."
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