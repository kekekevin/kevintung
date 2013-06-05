require 'spec_helper'

describe Slot do

  it "should have and belong to many performers" do
    should have_and_belong_to_many :performers
  end

end
