require 'spec_helper'

describe Post do

  it "should have a valid factory" do
    expect(FactoryGirl.create(:post)).to be_valid
  end

end
