require "spec_helper"

describe ParItem do

  it "has a valid factory" do
    expect(FactoryGirl.create(:par_item)).to be_valid
  end

  it "should validate the presence of name" do
    should validate_presence_of(:name)
  end

  it "should have a unique name" do
    should validate_uniqueness_of(:name)
  end

  it "should have many ParSheetItems" do
    should have_many(:par_sheet_items)
  end

end
