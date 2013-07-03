require 'spec_helper'

describe PostsController do

  describe "index" do

    it "returns all published posts" do
      published_post = FactoryGirl.create(:post, :state => :published)
      drafted_post = FactoryGirl.create(:post, :state => :drafted)
      
      get 'index'

      expect(assigns(:posts)).to eq [published_post]
    end

  end

end
