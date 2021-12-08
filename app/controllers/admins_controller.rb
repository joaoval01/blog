class AdminsController < ApplicationController
    layout "admin"
    def index
        @users = User.all
    end
end
