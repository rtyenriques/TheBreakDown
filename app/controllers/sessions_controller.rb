class SessionsController < ApplicationController

    def new
    end

    def create
        
        @user = User.find_by(id: params[:user][:user_id])
    
        if @user.nil?
          redirect_to '/login'
        else
        
        
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        
        redirect_to profile_path(@user.id)
         end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/'
      end

end