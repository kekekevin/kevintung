require 'spec_helper'

describe TagsController do

  describe "new" do
    
    it "assigns a new tag" do
      get :new
      
      expect(assigns :tag).to be_a_new Tag
    end
     
  end
  
  describe "create" do
    
    it "redirects to tags" do
      post :create, :tag => FactoryGirl.attributes_for(:tag)
      
      expect(response).to redirect_to(tags_url)
    end
    
    it "creates a new tag" do
      expect {
        post :create, :tag => FactoryGirl.attributes_for(:tag)
        }.to change(Tag, :count).by 1
    end
    
  end
  
  describe "destroy" do
    
    context "with existing tag" do
      
      let!(:tag) { FactoryGirl.create(:tag) }
    
      it "redirects to tags" do
        delete :destroy, :id => tag.id
        
        expect(response).to redirect_to(tags_url)
      end
      
      it "deletes the tag" do
        expect{
          delete :destroy, :id => tag.id
          }.to change(Tag, :count).by -1
      end
      
    end
    
  end
  
  describe "edit" do
    
    context "with existing tag" do
      
      let!(:tag) { FactoryGirl.create(:tag) }
      
      it "retrieves the tag" do
        get :edit, :id => tag.id
        
        expect(assigns :tag).to eq tag
      end
      
    end
    
  end
  
  describe "update" do
    
    context "with existing tag" do
      
      let!(:tag) { FactoryGirl.create(:tag) }
      
      it "updates the tag" do
        put :update, :id => tag.id, :tag => FactoryGirl.attributes_for(:tag, :name => "existing")
        
        tag.reload
        expect(tag.name).to eq "existing"
      end
      
      it "redirects to tags" do
        put :update, :id => tag.id, :tag => FactoryGirl.attributes_for(:tag)
        
        expect(response).to redirect_to(tags_url)
      end
      
    end
    
  end
  
  describe "index" do
    
    let!(:tag) { FactoryGirl.create(:tag) }
    
    it "shows all tags" do
      get :index
      
      expect(assigns :tags).to eq [tag]
    end
    
  end
  
end
