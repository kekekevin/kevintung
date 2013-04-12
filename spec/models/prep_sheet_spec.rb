require 'spec_helper'

describe PrepSheet do

  it "should belong to a par_sheet" do
    should belong_to(:par_sheet)
  end

end
