class CommentsController < ApplicationController

    private

    def comment_params
        params.require(:comment).permit(:title, :content, :rating, :move_tutorial_id, :user_id, :user_attributes: [:username, :email])

    end
end
