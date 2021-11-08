class CommentsController < ApplicationController
  before_action :authorized

    def index
        @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
        @comments = Comment.all
     end

    def create  
      comment = Comment.new(comment_params)
      comment.user_id = session[:user_id]
      if comment.save
        redirect_to move_tutorial_comments_path(comment.move_tutorial_id)
      else
        redirect_to '/home'
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:title, :rating, :content, :move_tutorial_id, :user_id, user_attributes:[:username, :email], move_tutorial_attributes:[:name])
    end
  end
  