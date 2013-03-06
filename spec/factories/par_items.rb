require 'faker'

FactoryGirl.define do
  factory :par_item do
    description Faker::Lorem.paragraph
    name Faker::Lorem.word
  end
end
