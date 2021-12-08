class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id   
        

        if @comment.save
            respond_to do |format|
                format.js
                @comments = Comment.where(post_id: @comment.post_id).order(:created_at)
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        
        if @comment.destroy
            respond_to do |format|
                format.js
                @comments = Comment.all.order(:created_at)
                @comments_null = Comment.all.select { |comment| !(comment.comment_id.present?) } 
            end
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:description, :post_id, :user_id, :comment_id)  
    end
end
