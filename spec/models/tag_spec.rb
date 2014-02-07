require 'spec_helper'

describe Tag do
  
  describe "name" do
    it { should validate_presence_of :name }
  end
  
end