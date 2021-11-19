class PostsController < ApplicationController
    def index
        @posts = Post.order(:name)
    end

    def new
        @post = Post.new
        @users = User.order(:email)
    end

    def edit
        @post = Post.find(params[:id])
        @users = User.order(:email)
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to posts_path
        else
            render :new, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.present?
            @post.destroy
        end    
        redirect_to posts_path
    end
    
    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
          redirect_to posts_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    private
    def post_params
      params.require(:post).permit(:name, :content, :summary, :user_id, :avatar)
    end
end
