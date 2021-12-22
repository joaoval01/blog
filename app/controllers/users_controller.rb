class UsersController < ApplicationController
    layout "admin"
    def index
        @users = User.order(:id)
    end

    def new
        @user = User.new
        @roles = Role.order(:id)
    end

    def create
        @user = User.new(users_params)
        @user.save!
        redirect_to users_path
    end

    def edit
        @user = User.find(params[:id])
        @roles = Role.order(:id)
    end


    def update
        @user = User.where(id: users_params[:id])

        if @user.role_id == 1
            redirect_to root_path
        end
        if @user.update(users_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(params[:id])  
        if @user.role_id == 1
            redirect_to root_path
        end      
        if @user.destroy
            redirect_to root_path
        end
    end


    private
    def users_params
        params.require(:user).permit(:id, :email, :password, :role_id)
    end
end
