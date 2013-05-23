require "spec_helper"

describe ParSheet do

  it "should validate the presence of name" do
    should validate_presence_of(:name)
  end

  it "should have a valid factory" do
    FactoryGirl.create(:par_sheet).should be_valid
  end

  it "should have many ParSheetItems" do
    should have_many(:par_sheet_items)
  end

  it "should have many PrepSheets" do
    should have_many(:prep_sheets)
  end

end
