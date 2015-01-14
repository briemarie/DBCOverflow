require 'factory_girl_rails'
require 'faker'

FactoryGirl.define do
    factory :question do
        title {Faker::Company.catch_phrase}
        content {Faker::Lorem.sentence}
    end

    factory :answer do
        title {Faker::Company.catch_phrase}
        content {Faker::Lorem.sentence}
    end
end
