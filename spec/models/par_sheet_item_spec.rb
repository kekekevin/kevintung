require "spec_helper"

describe ParSheetItem do

  it "should have a valid factory" do
    expect(FactoryGirl.create(:par_sheet_item)).to be_valid
  end

  it "should validate presence of par_count" do
    should validate_presence_of(:par_count)
  end

  it "should belong to a ParSheet" do
    should belong_to(:par_sheet)
  end

  it "should belong to a ParItem" do
    should belong_to(:par_item)
  end

  it "should be invalid with a negative par_count" do
    expect(FactoryGirl.build(:par_sheet_item, :par_count => "-1")).not_to be_valid
  end

  it "should be invalid with a zero par_count" do
    expect(FactoryGirl.build(:par_sheet_item, :par_count => "0")).not_to be_valid
  end

  it "should be valid with a positive par_count" do
    expect(FactoryGirl.build(:par_sheet_item, :par_count => "2")).to be_valid
  end

end
