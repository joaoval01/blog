class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment_son = Comment.new
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id   
        if @comment.save
            @comments = Comment.where(post_id: @comment.post_id).where(comment_id: nil).order(created_at: :desc)
            respond_to do |format|
                format.js
            end
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comments = Comment.where(post_id: @comment.post_id).where(comment_id: nil).order(created_at: :desc)        
        if @comment.destroy
            respond_to do |format|
                format.js
            end
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:description, :post_id, :user_id, :comment_id)  
    end
end
