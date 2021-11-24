class HomeController < ApplicationController
    skip_before_action :authenticate_user!, only: [:index]
    def index
        @posts = Post.order(:name)
    end
end
