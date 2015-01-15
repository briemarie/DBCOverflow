class QuestionsController < ApplicationController
    def index #get route
        api = QuestionsHelper::Proverb.new()
        @proverb = api.get_proverb

        @question = Question.new
        @questions = Question.all
    end

    def show #get route
        @new_answer = Answer.new

        @question = Question.find(params[:id])
        @answers = @question.answers
    end

    def new
        @question = Question.new
    end

    def edit #This is the get route
        @question = Question.find(params[:id])
    end

    def create #post route
        @question = Question.new(question_params)

        if @question.save
            redirect_to @question
        else
            render 'new'
        end
    end

    def update #This is the patch route
        @question = Question.find(params[:id])

        if @question.update(question_params)
            redirect_to @question
        else
            render 'edit'
        end
    end

    def destroy #Post route
        @question = Question.find(params[:id])
        @question.destroy

        redirect_to questions_path
    end

    def up_vote
        @question = Question.find(params[:id])
        @question.increment!(:vote_count)

        redirect_to questions_path
    end

    def down_vote
        @question = Question.find(params[:id])
        @question.decrement!(:vote_count)

        redirect_to questions_path
    end

    private
        def question_params
            params.require(:question).permit(:title, :content, :vote_count)
        end
end
