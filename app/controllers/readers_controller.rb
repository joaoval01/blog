class ReadersController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
    def index
        @readers = Reader.order(:email)
        if current_user && current_user.admin?
          render :layout => "admin"
        end
    end

    def new
        @reader = Reader.new
    end

    def create
        @reader = Reader.new(reader_params)
    
        if @reader.save
          redirect_to reader_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @reader = Reader.find(params[:id])
    end

    def update
        @reader = Reader.find(params[:id])
    
        if @reader.update(reader_params)
          redirect_to reader_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @reader = Reader.find(params[:id])
        
        if @reader.present?
            @reader.destroy 
        end
        redirect_to reader_path
    end
    
    private
    def reader_params
        params.require(:reader).permit(:username, :password)
    end
end
