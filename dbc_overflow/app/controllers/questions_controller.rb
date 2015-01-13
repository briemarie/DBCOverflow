class QuestionsController < ApplicationController
    def index
        @questions = Question.all
    end

    def show
        @question = Question.find(params[:id])
        @answers = Answer.all.find_by(question_id: @question.id)
    end

    def new
    end

    def edit
    end

    def create
    end

    def update
    end

    def destroy
    end
end
