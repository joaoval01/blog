class EvaluationsController < ApplicationController
    def new
        @evaluation = Evaluation.new
    end

    def create
        @evaluation = Evaluation.new(evaluation_params)
        @evaluation.user_id = current_user.id   
        

        if @evaluation.save
            print('ok')
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @evaluation = Evaluation.find(params[:id])  
        @evaluation.destroy

    end

    private
    def evaluation_params
        params.require(:evaluation).permit(:value, :post_id, :user_id)  
    end
end
