class UsersController < ApplicationController
    # after_action :authorized, only: [:create]
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def new
        if logged_in?
            redirect_to profile_path(session[:user_id])
        else
        @user = User.new
        end
        

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
        @move_tutorials = MoveTutorial.all
        @session = session[:user_id]  
    end

    def edit
    end


    def update
       @user.update(user_params)
        if @user.valid?
        redirect_to profile_path(@user)
        else
        flash.now[:notice] = "Please make sure all filelds are correct."
        render :edit
        end
    end

    def destroy
        @user.destroy
        session[:user_id] = nil
        redirect_to '/'
    end
    
    private

    def set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:id, :email, :username, :password, :password_confirmation)
    end
end
