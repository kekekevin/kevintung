require 'faker'

FactoryGirl.define do
  factory :par_sheet do
    name Faker::Lorem.word

    after(:create) do |par_sheet, evaluator|
      FactoryGirl.create_list(:par_sheet_item, 1, par_sheet: par_sheet)
    end
  end
end
