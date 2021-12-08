class AdminsController < ApplicationController
    layout "admin"
    def index
        @users = User.all
    end
    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new

        if @admin.save
            redirect_to admins_path
        else
            render :new, status: :unprocessable_entity
        end
    end
end
