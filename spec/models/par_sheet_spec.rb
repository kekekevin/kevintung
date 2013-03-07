require 'spec_helper'

describe ParSheet do

  it 'should be invalid without a name' do
    FactoryGirl.build(:par_sheet, name: nil).should be_invalid
  end

  it 'should have a valid factory' do
    FactoryGirl.create(:par_sheet).should be_valid
  end
end
