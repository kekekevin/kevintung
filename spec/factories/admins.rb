require 'faker'

FactoryGirl.define do
  factory :admin do
    email Faker::Internet.email
    password "asdfasdf"
  end
end
