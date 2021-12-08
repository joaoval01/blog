class EvaluationsController < ApplicationController
    def new
        @evaluation = Evaluation.new
    end

    def create
        @evaluation = Evaluation.new(evaluation_params)
        @evaluation.user_id = current_user.id   
        

        if @evaluation.save
            respond_to do |format|
                format.js
            end
        else
            render :new, status: :unprocessable_entity
        end
        @evaluations = Evaluation.where(post_id: @evaluation.post_id)

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
