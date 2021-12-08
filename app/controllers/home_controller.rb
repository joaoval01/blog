class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
    
    def post
        @post = Post.find(params[:id]) 
        @comment = Comment.new
        @comment_son = Comment.new
        
        @comments = Comment.where(post_id: @post.id).where(comment_id: nil)

        @evaluation = Evaluation.new
        @evaluations = Evaluation.where(post_id: @post.id)

        if @evaluations.present?
            @value_median = evaluation_media(@evaluations)
        end
    end

    def evaluation_media(evaluation)
        value = 0
        i = 0
        evaluation.each do |e|
            value += e.value
            i += 1
        end
        return value / i
    end

end
