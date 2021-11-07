# class CommentsController < ApplicationController

#     def new
        
#        if @category = Category.find_by_id(params[:category_id])
#         @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
#             @comment = @move_tutorial.comments.build
#        else
#         # @move_tutorial = MoveTutorial.find_by_id(params[:move_tutorial_id])
#         @comment = Comment.new
       
#        end

#     end

#     def create 
        
#         @comment = Comment.new(comment_params)
#         @comment.user_id = session[:user_id]
#         @comment.move_tutorial_id = params[:id]
#         if @comment.save
#             redirect_to move_tutorial_path(@comment.move_tutorial_id)
#         else
#             render :new
#         end 
   
#     end

#     private

#     def comment_params
#         params.require(:comment).permit(:title, :content, :rating, :move_tutorial_id, :user_id, user_attributes: [:username, :email])

#     end
# end

class CommentsController < ApplicationController

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
  