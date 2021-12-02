class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    
    def post
        @post = Post.find(params[:id])
        @comments = Comment.order(:id) 

        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.post_id = @post.id
    end
end
