# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    title "MyString"
    body "MyText"
    state "MyString"
    published_at "2013-06-27 23:26:06"
  end
end
