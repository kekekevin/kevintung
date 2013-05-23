require "spec_helper"

describe PrepSheet do

  it "should belong to a par_sheet" do
    should belong_to(:par_sheet)
  end

  it "should have many prep sheet items" do
    should have_many(:prep_sheet_items)
  end

  describe "new from par sheet" do

    before(:each) do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @prep_sheet = PrepSheet.new_from_par_sheet(@par_sheet)
    end

    it "should create a prep sheet item for each par sheet item" do
      @prep_sheet.prep_sheet_items.length.should == @par_sheet.par_sheet_items.length
      @prep_sheet.prep_sheet_items[0].par_count.should == @par_sheet.par_sheet_items[0].par_count
    end

    it "should reference the same par sheet item" do
      @prep_sheet.par_sheet.id.should == @par_sheet.id
    end

  end

  describe "make_calculated_prep_sheet" do

    it "should calculate the prep_count for each item" do
      prep_sheet_attributes = FactoryGirl.attributes_for(:prep_sheet)
      prep_sheet_attributes[:prep_sheet_items_attributes] = { "1" => FactoryGirl.attributes_for(:prep_sheet_item, :prep_count => nil) }

      prep_sheet = PrepSheet.make_calculated_prep_sheet( prep_sheet_attributes )

      prep_sheet.prep_sheet_items[0].prep_count.should == BigDecimal.new("1")
    end

  end

end
