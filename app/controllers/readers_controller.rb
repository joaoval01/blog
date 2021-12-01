class ReadersController < ApplicationController
    class CategoriesController < ApplicationController
        before_action :authenticate_user!
        load_and_authorize_resource
          def index
              @readers = Reader.order(:username)
          end
      
          def new
              @reader = Reader.new
          end
      
          def create
              @reader = Reader.new(reader_params)
          
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
              
              if @reader.present?
                 @reader.destroy 
              end
              redirect_to reader_path
          end
          
          private
          def reader_params
              params.require(:category).permit(:username, :email, :password)
          end
      end
end
