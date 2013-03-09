require 'spec_helper'

describe ParItemsController do

  it "should create an item" do
    par_item = FactoryGirl.build(:par_item)
    ParItem.should_receive(:new).and_return(par_item)

    post :create, par_item: par_item.attributes

    response.should redirect_to(par_item_path(par_item))
  end

  it "should retrieve an item to be shown" do
    par_item = FactoryGirl.create(:par_item)

    get :show, id: par_item.id

    assigns(:par_item).should eq(par_item)
    response.should render_template(:show)
  end

  it "should retrieve all items to be shown" do
    par_item = FactoryGirl.create(:par_item)
    
    get :index

    assigns(:par_items).should eq([par_item])
    response.should render_template(:index)
  end

  it "should create a new item" do
    ParItem.should_receive(:new)

    get :new

    assigns(:par_item)
    response.should render_template(:new)
  end

  it "should retrieve existing item to edit" do
    par_item = FactoryGirl.create(:par_item)

    get :edit, id: par_item.id

    assigns(:par_item).should eq(par_item)
    response.should render_template(:edit)
  end

  it "should update an existing item" do
    par_item = FactoryGirl.create(:par_item)
    ParItem.should_receive(:update).and_return(par_item)

    put :update, id: par_item.id, par_item: par_item.attributes

    assigns(:par_item).should eq(par_item)
    response.should redirect_to par_item_path(par_item)
  end

  it "should destroy an existing item" do
    par_item = FactoryGirl.create(:par_item)

    delete :destroy, id: par_item.id

    response.should redirect_to par_items_url
  end

end
