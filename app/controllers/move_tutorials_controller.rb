class MoveTutorialsController < ApplicationController

    def index
        @move_tutorials = MoveTutorial.all

    end
    def new
        @move_tutorial = MoveTutorial.new
        @move_tutorial.build_category
    
       
    end

    def create
        
        @move_tutorial = MoveTutorial.new(move_params)
    
        # @move_tutorial.user_id = session[:user_id]
        @move_tutorial.user_id = current_user.id
        if @move_tutorial.save
            redirect_to @move_tutorial
        else
            render :new
        end
      

           
        end

        def show
            
            @move = MoveTutorial.find(params[:id])
            @user = session[:user_id]
           

        end

    private

    def move_params
        params.require(:move_tutorial).permit(:name, :difficulty, :learn_time, :description, :category_id, category_attributes: [:name])

    end
end
