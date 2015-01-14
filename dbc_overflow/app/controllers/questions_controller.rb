class QuestionsController < ApplicationController
    def index
        @question = Question.create

        @questions = Question.all
    end

    def show
        @new_answer = Answer.create

        @question = Question.find(params[:id])
        @answers = Answer.all.where(question_id: @question.id)
    end

    def new
    end

    def edit
    end

    def create
        Question.create(params[:question])
    end

    def update
    end

    def destroy
    end

    private
        def question_params
            params.require(:question).permit(:title, :content)
        end
end
