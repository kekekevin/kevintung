require 'spec_helper'

describe Post do

  it "should have a valid factory" do
    expect(FactoryGirl.create(:post)).to be_valid
  end

  describe "published?" do

    it "should be true if state is :published" do
      post = FactoryGirl.create(:post, :state => :published)
      expect(post.published?).to be_true
    end

    it "should be false otherwise" do
      post = FactoryGirl.create(:post)
      expect(post.published?).not_to be_true
    end

  end

  describe "scope published" do
    
    it "should return published posts in descending order" do
      post1 = FactoryGirl.create(:post, :state => :published, :published_at => Time.now)
      post2 = FactoryGirl.create(:post, :state => :drafted)
      post3 = FactoryGirl.create(:post, :state => :published, :published_at => Time.now + 1.day)

      expect(Post.published).to eq [post3, post1]
    end

  end

end
