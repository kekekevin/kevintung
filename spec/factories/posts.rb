require 'faker'

FactoryGirl.define do
  factory :post do
    title Faker::Lorem.sentence
    body "MyText"
    state "MyString"
    published_at "2013-06-27 23:26:06"
    slug Faker::Lorem.sentence
  end
end
