class MoveTutorialsController < ApplicationController
    before_action :set_moves, only: [:show, :edit, :update, :destroy]
    before_action :authorized

    def index
       @move_tutorials = MoveTutorial.all
    end

    def new
        @move_tutorial = MoveTutorial.new 
        @move_tutorial.category_id = params[:category_id]
      
     end

    def create
      
        @move_tutorial = MoveTutorial.new(move_params)
        @move_tutorial.user_id = current_user.id
          if @move_tutorial.save
            redirect_to @move_tutorial
          else
            render :new
          end
      end

        def show
          @user = session[:user_id]
          
        end

        def edit
            if logged_in? && @move_tutorial.user_id == current_user.id
                render :edit
            else
                unauthorized_user
            end
           
        end




        def update
          if @move_tutorial.update(move_params)
            redirect_to move_tutorial_path(@move_tutorial.id), notice: "update successful"

          else
            render :edit
          end

        end

        def destroy
            @move_tutorial.destroy
            redirect_to move_tutorials_path
         end

         def beginner
            @move_tutorials = MoveTutorial.difficulty_beginner

         end

    private

    def set_moves
        @move_tutorial = MoveTutorial.find_by_id(params[:id])    
     end

    def move_params
        params.require(:move_tutorial).permit(:name, :difficulty, :learn_time, :description, :category, :category_id, category_attributes: [:name])
    end

end
