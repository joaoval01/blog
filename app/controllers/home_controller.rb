class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
        if current_user && current_user.admin?
            render :layout => "admin"
        end
    end
end
