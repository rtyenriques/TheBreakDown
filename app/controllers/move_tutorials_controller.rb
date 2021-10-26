class MoveTutorialsController < ApplicationController

    def index
        @move_tutorials = MoveTutorial.all
    end

    def new
        @move_tutorial = MoveTutorial.new
     end

    def create
        @move_tutorial = MoveTutorial.new(move_params)
        # @move_tutorial.user_id = session[:user_id]
        @move_tutorial.user_id = current_user.id
          if @move_tutorial.save
            # @move_tutorial.user_id  << @move_tutorial
            redirect_to @move_tutorial
          else
            render :new
          end
      end

        def show
          if @category = Category.find_by_id(params[:category_id])
            
            @move = MoveTutorial.find_by_id(params[:id])
            @user = session[:user_id]
            else
                @move = MoveTutorial.find_by_id(params[:id])
                @user = session[:user_id]
                @comment = Comment.new
            end
           

        end

        def edit
            @move_tutorial = MoveTutorial.find_by_id(params[:id])
        end


        def destroy
            @move = MoveTutorial.find_by_id(params[:id]).destroy
           
            redirect_to move_tutorials_path

        end
    private

    def move_params
        params.require(:move_tutorial).permit(:name, :difficulty, :learn_time, :description, :category_id, category_attributes: [:name])

    end
end
