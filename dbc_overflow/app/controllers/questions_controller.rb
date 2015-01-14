class QuestionsController < ApplicationController
    def index #get route
        @question = Question.create

        @questions = Question.all
    end

    def show #get/post route
        @new_answer = Answer.create

        @question = Question.find(params[:id])
        @answers = Answer.find_by(question_id: @question.id)
    end

    # def new #get route
    #     @question = Question.new
    # end

    def edit #This is the get route
        @question = Question.find(params[:id])
    end

    def create #post route
        @question = Question.create(question_params)
        if @question.save
            redirect_to questions_path
        else
            render 'new'
        end
    end

    def update #This is the patch route
        @question = Question.find(params[:id])

        if @question.update_attributes(question_params)
            redirect_to questions_path
        else
            render 'edit'
        end
    end

    def destroy #Post route
        @question = Question.find(params[:id])
        @question.destroy
    end

    private
        def question_params
            params.require(:question).permit(:title, :content)
        end
end
