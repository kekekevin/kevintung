require 'spec_helper'

describe Performer do

  it "should have and belong to many slots" do
    should have_and_belong_to_many(:slots)
  end

  it "should have a valid factory" do
    FactoryGirl.create(:performer).should be_valid
  end

end
