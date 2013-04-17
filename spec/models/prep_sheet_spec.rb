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
      @prep_sheet = PrepSheet.new_from_par_sheet(@par_sheet)
    end

    it "should create a prep sheet item for each par sheet item" do
      @prep_sheet.prep_sheet_items.length.should eq(@par_sheet.par_sheet_items.length)
    end

    it "should not create a prep sheet item when the resulting prep sheet count is 0" do
      par_sheet_item = @par_sheet.par_sheet_items[0]
      par_sheet_item.count = par_sheet_item.par_count
      @prep_sheet = PrepSheet.new_from_par_sheet(@par_sheet)

      @prep_sheet.prep_sheet_items.length.should eq(0)
    end

    it "should create a prep sheet item count" do
      @prep_sheet.prep_sheet_items[0].count.should eq(BigDecimal.new("4"))
    end

    it "should reference the same par sheet item" do
      @prep_sheet.par_sheet.id.should eq(@par_sheet.id)
    end
  end

end
