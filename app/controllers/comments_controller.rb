class CommentsController < ApplicationController

    def new
        
       if @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
            @comment = @move_tutorial.comments.build
       else
        @comment = Comment.new
       end

    end

    def create 
        @comment = Comment.new(comment_params)
        @comment.user_id = session[:user_id]
        if @comment.save
            redirect_to move_tutorial_path(@comment.move_tutorial_id)
        else
            render :new
        end 
   
    end

    private

    def comment_params
        params.require(:comment).permit(:title, :content, :rating, :move_tutorial_id, :user_id, user_attributes: [:username, :email])

    end
end
