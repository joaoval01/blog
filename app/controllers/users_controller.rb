class UsersController < ApplicationController
    layout "admin"
    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(users_params)
        @user.save!
        redirect_to users_path
    end

    def edit
        @user = User.find(params[:id])

    end


    def update
        @user = User.where(id: users_params[:id])

    
        if @user.update(users_params)
          redirect_to users_path
        else
          render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(params[:id])        
        if @user.destroy
            redirect_to users_path
        end
    end


    private
    def users_params
        params.require(:user).permit(:id, :email, :password, :role_id)
    end
end
