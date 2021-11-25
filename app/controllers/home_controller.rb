class HomeController < ApplicationController
    def index
        @posts = Post.order(:name)
    end
end
