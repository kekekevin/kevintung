require 'spec_helper'

describe ParItemsController do

  describe "create item" do

    it "should create an item" do
      expect {
        post :create, :par_item => FactoryGirl.attributes_for(:par_item)
      }.to change(ParItem, :count).by(1)

      response.should redirect_to(ParItem.last)
    end

    it "should respond to json" do
      post :create, par_item: FactoryGirl.attributes_for(:par_item), :format => :json

      response.body.should == ParItem.last.to_json
    end

  end

  it "should retrieve an item to be shown" do
    par_item = FactoryGirl.create(:par_item)

    get :show, :id => par_item.id

    assigns(:par_item).should == par_item
    response.should render_template(:show)
  end

  describe "index" do

    before do
      @par_item = FactoryGirl.create(:par_item)
    end
    
    it "should retrieve all items to be shown" do
      get :index

      assigns(:par_items).should == [@par_item]
      response.should render_template(:index)
    end

    it "should respond do json" do
      get :index, :format => :json

      response.body.should == [@par_item].to_json
    end

  end

  it "should create a new item" do
    ParItem.should_receive(:new)

    get :new

    assigns(:par_item)
    response.should render_template(:new)
  end

  it "should retrieve existing item to edit" do
    par_item = FactoryGirl.create(:par_item)

    get :edit, :id => par_item.id

    assigns(:par_item).should == par_item
    response.should render_template(:edit)
  end

  it "should update an existing item" do
    par_item = FactoryGirl.create(:par_item, :name => "existing")

    put :update, :id => par_item.id, :par_item => FactoryGirl.attributes_for(:par_item) 

    assigns(:par_item).should == par_item
    response.should redirect_to par_item_path(par_item)
    par_item.reload
    par_item.name.should_not eq("existing")
  end

  it "should destroy an existing item" do
    par_item = FactoryGirl.create(:par_item)

    delete :destroy, :id => par_item.id

    response.should redirect_to par_items_url
  end

end
