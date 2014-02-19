require 'spec_helper'

describe TagsController do

  describe 'new' do
    
    it "assigns a new tag" do
      get :new
      
      expect(assigns :tag).to be_a_new Tag
    end
     
  end
  
end
