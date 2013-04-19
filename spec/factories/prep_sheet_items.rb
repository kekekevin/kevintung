# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prep_sheet_item do
    count "2"
    prep_count "1"
    par_count "3"
    par_item
  end
end
