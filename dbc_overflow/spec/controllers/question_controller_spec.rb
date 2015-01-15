require "rails_helper"
require "factory_girl_rails"

describe QuestionsController do
  context "#index" do
    let(:question){FactoryGirl.create(:question)}
      it "responds successfully" do
        get :index

        expect(response).to be_success
      end

      it "renders the index template" do
        get :index

        expect(response).to render_template("index")
      end

      it "assigns questions to Question.all" do
        build(:question)
        get :index

        expect(assigns(:question)).to eq Question.all.first
    end
  end

  context "#show" do
    let!(:question){FactoryGirl.create(:question)}
    let!(:answer){FactoryGirl.create(:answer, question: question)}

      it "responds successfully" do
        get :show, id: question.id

        expect(response).to be_success
      end

      it "renders the show template" do
        get :show, id: question.id

        expect(response).to render_template("show")
      end

      it "displays a question" do
        build(:question)
        get :show, id: question.id

        expect(assigns(:question)).to eq Question.all.first
      end

      it "displays all answers to a question" do
        build(:answer)
        get :show, id: question.id

        expect(assigns(:answer)).to eq Answer.all
      end
  end
end