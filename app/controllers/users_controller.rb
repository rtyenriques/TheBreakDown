class UsersController < ApplicationController
    # after_action :authorized, only: [:create]

    def new
        @user = User.new
        

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
        authorized
        set_user
        @session = session[:user_id]
     
    end

    def edit
        set_user

    end

    def update
        set_user
        if   @user.authenticate(params[:user][:password])
            @user.update(user_params)
    
      
        redirect_to profile_path(@user)
        
    else
        
        flash.now[:notice] = "Please make sure all filelds are correct."
        render :edit
    end
    

    end

    

    private

    def set_user
        @user = User.find_by_id(params[:id])

    end

    def user_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)

    end
end
