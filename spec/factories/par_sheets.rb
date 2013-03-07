require 'faker'

FactoryGirl.define do
  factory :par_sheet do
    name Faker::Lorem.word
    par_sheet_items { [build(:par_sheet_item)] }
  end
end
