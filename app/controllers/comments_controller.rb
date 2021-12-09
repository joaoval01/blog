class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    load_and_authorize_resource
    layout "admin"

    def index
        @comments = Comment.order(created_at: :desc)
    end


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
            redirect_to comments_path
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:description, :post_id, :user_id, :comment_id)  
    end
end
