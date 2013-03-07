require 'spec_helper'

describe ParSheetItem do

  it 'should have a valid factory' do
    FactoryGirl.create(:par_sheet_item).should be_valid
  end

  it 'should be invalid without a par_count' do
    FactoryGirl.build(:par_sheet_item, par_count: nil).should_not be_valid
  end

  it 'should be invalid without a count' do
    FactoryGirl.build(:par_sheet_item, count: nil).should_not be_valid
  end

  it 'should be invalid with a negative par_count' do
    FactoryGirl.build(:par_sheet_item, par_count: '-1').should_not be_valid
  end

  it 'should be invalid with a zero par_count' do
    FactoryGirl.build(:par_sheet_item, par_count: '0').should_not be_valid
  end

  it 'should be invalid with a negative count' do
    FactoryGirl.build(:par_sheet_item, count: '-1').should_not be_valid
  end

  it 'should be valid with a zero count' do
    FactoryGirl.build(:par_sheet_item, count: '0').should be_valid
  end

end
