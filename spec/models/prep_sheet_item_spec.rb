require "spec_helper"

describe PrepSheetItem do

  it "should have a valid factory" do
    expect(FactoryGirl.create(:prep_sheet_item)).to be_valid
  end

  it "should be invalid with nil prep_count" do
    expect(FactoryGirl.build(:prep_sheet_item, :prep_count => nil)).not_to be_valid
  end

  it "should be invalid with negative prep_count" do
    expect(FactoryGirl.build(:prep_sheet_item, :prep_count => -1)).not_to be_valid
  end

  it "should be invalid with nil count" do
    expect(FactoryGirl.build(:prep_sheet_item, :count => nil)).not_to be_valid
  end

  it "should be invalid with negative count" do
    expect(FactoryGirl.build(:prep_sheet_item, :count => -1)).not_to be_valid
  end
  
  it "should be invalid with nil par_count" do
    expect(FactoryGirl.build(:prep_sheet_item, :par_count => nil)).not_to be_valid
  end

  it "should be invalid with negative par_count" do
    expect(FactoryGirl.build(:prep_sheet_item, :par_count => -1)).not_to be_valid
  end

  it "should be invalid with zero par_count" do
    expect(FactoryGirl.build(:prep_sheet_item, :par_count => 0)).not_to be_valid
  end

  it "should belong_to a prep_sheet" do
    should belong_to(:prep_sheet)
  end

  it "should belong_to a par_item" do
    should belong_to(:par_item)
  end

end
