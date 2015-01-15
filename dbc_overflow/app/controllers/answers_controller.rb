class AnswersController < ApplicationController

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.create(answer_params)

        redirect_to question_path(@question)
    end

    def up_vote
        @answer = Answer.find(params[:id])
        @answer.increment!(:vote_count)

        redirect_to question_path(@question)
    end

    def down_vote
        @answer = Answer.find(params[:id])
        @answer.decrement!(:vote_count)

        redirect_to question_path(@question)
    end

    private
        def answer_params
            params.require(:answer).permit(:title, :content, :vote_count)
        end
end
