require 'spec_helper'

describe ParItem do

  it 'has a valid factory' do
    FactoryGirl.create(:par_item).should be_valid
  end

  it 'is invalid without a name' do
    FactoryGirl.build(:par_item, name: nil).should_not be_valid
  end

  it 'is invalid with a blank name' do
    FactoryGirl.build(:par_item, name: '').should_not be_valid
  end

  it 'should have a unique name' do
    par_item = FactoryGirl.create(:par_item)
    FactoryGirl.build(:par_item, name: par_item.name)
  end
end
