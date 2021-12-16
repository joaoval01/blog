class EvaluationsController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource
    layout "admin"
    def new
        @evaluation = Evaluation.new
    end

    def index
        @evaluations = Evaluation.all
    end

    def create
        @evaluation = Evaluation.new(evaluation_params)
        @test = Evaluation.where(post_id: @evaluation.post_id).where(user_id: @current_user.id)
        if @test == []
            @evaluation.user_id = current_user.id  
            @evaluation.save
        else
            @test.update(evaluation_params)
        end
        
        @value_median = Evaluation.where(post_id: @evaluation.post.id).average('value')
    end

    def update
        @evaluation = Evaluation.find(params[:id])
        @evaluation.update(evaluation_params)
    end

    def destroy
        @evaluation = Evaluation.find(params[:id])  
        @evaluation.destroy
        redirect_to evaluations_path
    end

    private
    def evaluation_params
        params.require(:evaluation).permit(:value, :post_id, :user_id, :id)  
    end
end
