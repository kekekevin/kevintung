require 'spec_helper'
require 'factory_girl'

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

end
