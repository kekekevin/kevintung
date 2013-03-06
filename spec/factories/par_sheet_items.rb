# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :par_sheet_item do
    par_count "9.99"
    count "9.99"
    par_sheet nil
    par_item nil
  end
end
