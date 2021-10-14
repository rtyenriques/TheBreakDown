class UsersController < ApplicationController
    after_action :authorized, only: [:create]
    def new
        

    end

    def create
        
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to profile_path(@user)
         
        else 
            render :new
        end


    end

    def show
        @user = User.find_by_id(params[:id])
        authorized

    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)

    end
end
