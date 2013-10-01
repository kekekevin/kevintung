require 'spec_helper'

describe PostsController do

  describe "index" do

    it "returns all published posts" do
      published_post = FactoryGirl.create(:post, :state => :published)
      drafted_post = FactoryGirl.create(:post, :state => :drafted, :slug => "something unique")
      
      get :index

      expect(assigns(:posts)).to eq [published_post]
    end

  end

  describe "show" do

    it "returns the specified post" do
      published_post = FactoryGirl.create(:post, :state => :published)

      get :show, :id => published_post.id

      expect(assigns(:post)).to eq published_post
      expect(response).to render_template(:show)
    end

  end

  describe "admin functions" do

    before do

      sign_in FactoryGirl.create(:admin)

    end

    describe "new" do

      it "should initialize a new post" do
        get :new
        
        expect(assigns(:post)).not_to be_nil
      end

    end

    describe "create" do

      it "should save the new post" do
        expect {
          post :create, :post => FactoryGirl.attributes_for(:post)
        }.to change(Post, :count).by(1)

        expect(response).to redirect_to(posts_url)
        expect(Post.last.state).to eq "published"
        expect(Post.last.published_at).to be_within(5.seconds).of(Time.now)
      end

    end

  end

end
