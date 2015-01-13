require 'rails_helper'
require "factory_girl_rails"

describe Answer do
    let(:answer){FactoryGirl.create(:answer)}

    context "data input" do
        it "should have a title" do
            expect(answer.title).to_not be_empty
        end

        it "should have content" do
            expect(answer.content).to_not be_empty
        end
    end
end