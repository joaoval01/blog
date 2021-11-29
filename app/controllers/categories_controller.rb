class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
    def index
        @categories = Category.order(:name)
        if current_user && current_user.admin?
          render :layout => "admin"
      end
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
    
        if @category.save
          redirect_to categories_path
        else
          render :new, status: :unprocessable_entity
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
    
        if @category.update(category_params)
          redirect_to categories_path
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @category = Category.find(params[:id])
        
        if @category.present?
           @category.destroy 
        end
        redirect_to categories_path
    end
    
    private
    def category_params
        params.require(:category).permit(:name, :description)
    end
end