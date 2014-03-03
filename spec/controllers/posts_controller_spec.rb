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

  describe "admin function" do

    before do

      sign_in FactoryGirl.create(:admin)

    end

    describe "new" do

      it "initializes a new post" do
        get :new
        
        expect(assigns(:post)).not_to be_nil
      end
      
      it "populates available tags" do
        tag = FactoryGirl.create(:tag)
        
        get :new
        
        expect(assigns(:tags)).to eq [tag]
      end

    end

    describe "post create" do
      
      context "with an existing tag" do
        
        let(:tag) { FactoryGirl.create(:tag) }
        let!(:new_post) { FactoryGirl.attributes_for(:post, :tag_ids => [tag.id]) }

        it "saves the new post" do
          expect {
            post :create, :post => new_post
          }.to change(Post, :count).by(1)
        end
        
        it "redirects to posts" do
          post :create, :post => new_post
          
          expect(response).to redirect_to(posts_url)
        end
        
        it "saves the post with a published state" do
          post :create, :post => new_post
          
          expect(Post.last.state).to eq "published"
        end
        
        it "saves the publish time" do
          post :create, :post => new_post
          
          expect(Post.last.published_at).to be_within(5.seconds).of(Time.now)
        end
        
        it "saves the associated tag" do
          post :create, :post => new_post
          
          expect(Post.last.tags).to eq [tag]
        end
        
      end
        
    end

  end

end
