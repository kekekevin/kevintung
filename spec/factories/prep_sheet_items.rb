# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :prep_sheet_item do
    prep_sheet nil
    count "9.99"
    par_item nil
  end
end
