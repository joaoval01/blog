class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    
    def post
        @post = Post.find(params[:id]) 

        #comments
        @comment = Comment.new
        @comment_son = Comment.new
        @comments = Comment.where(post_id: @post.id).where(comment_id: nil).order(created_at: :desc)

        #evaluations
        @evaluation = Evaluation.new
        @evaluations = Evaluation.where(post_id: @post.id)
        @value_median = Evaluation.where(post_id: @post.id).average('value')
    end
end
