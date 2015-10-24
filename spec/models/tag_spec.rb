require 'spec_helper'

describe Tag do

  describe "name" do
    it { should validate_presence_of :name }
  end

  it { should have_and_belong_to_many :posts }

end
