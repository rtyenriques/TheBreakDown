class MoveTutorialsController < ApplicationController
    def new
        @move_tutorial = MoveTutorial.new
    
       
    end

    def create
        
        @move_tutorial = MoveTutorial.new(move_params)
        @move_tutorial.user_id = session[:user_id]
        if @move_tutorial.save
            redirect_to @move_tutorial
        else
            render :new
        end
      

           
        end

    private

    def move_params
        params.require(:move_tutorial).permit(:name, :difficulty, :learn_time, :description, category_attributes:[:name])

    end
end
