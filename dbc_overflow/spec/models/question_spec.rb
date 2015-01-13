require 'rails_helper'
require "factory_girl_rails"

describe Question do
    let(:question){FactoryGirl.create(:question)}

    context "data input" do
        it "should have a title" do
            expect(question.title).to_not be_empty
        end

        it "should have content" do
            expect(question.content).to_not be_empty
        end
    end
end


