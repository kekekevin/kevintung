require 'spec_helper'

describe PrepSheet do

  it "should belong to a par_sheet" do
    should belong_to(:par_sheet)
  end

  it "should have many prep sheet items" do
    should have_many(:prep_sheet_items)
  end

  describe "create from par sheet" do
    before(:each) do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @prep_sheet = PrepSheet.create_from_par_sheet(@par_sheet)
    end

    it "should create a prep sheet item for each par sheet item" do
      @prep_sheet.prep_sheet_items.length.should eq(@par_sheet.par_sheet_items.length)
    end

    it "should not create a prep sheet item when the par count is equivalent to the count" do
      pending
    end

    it "should create a prep sheet item count" do
      pending
    end

    it "should reference the same par sheet item" do
      pending
    end
  end

end
