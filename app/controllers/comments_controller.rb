class CommentsController < ApplicationController
  before_action :authorized, only: [:index, :show]

    def index
        @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
        @comments = Comment.all
     end

     def new
      @comment = Comment.new
     end

    def create  
      @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
      @comment = Comment.new(comment_params)
      @comment.user_id = current_user.id
      if @comment.save
        redirect_to move_tutorial_comments_path(@comment.move_tutorial_id)
      else
       
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:title, :rating, :content, :move_tutorial_id, :user_id, user_attributes:[:username, :email], move_tutorial_attributes:[:name])
    end
  end
  