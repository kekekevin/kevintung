require "spec_helper"

describe ParSheetItemsController do

  describe "index" do

    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @par_sheet_item = @par_sheet.par_sheet_items[0]
    end

    it "should return all par sheet items" do
      get :index, :par_sheet_id => @par_sheet.id, :format => :json

      expect(response.body).to eq [@par_sheet_item].to_json
    end

  end

  describe "create" do

    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
    end

    it "should create the item" do
      expect {
        post :create, :par_sheet_id => @par_sheet.id, :par_sheet_item => FactoryGirl.attributes_for(:par_sheet_item), :format => :json
      }.to change(ParSheetItem, :count).by(1)
    end

    it "should return the json object" do
      post :create, :par_sheet_id => @par_sheet.id, :par_sheet_item => FactoryGirl.attributes_for(:par_sheet_item), :format => :json

      expect(response.body).to eq ParSheetItem.last.to_json
      expect(ParSheetItem.last.par_sheet_id).to eq @par_sheet.id
    end

  end

  describe "update" do

    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @par_sheet_item = @par_sheet.par_sheet_items[0]

      put :update, :id => @par_sheet_item.id, :par_sheet_id => @par_sheet.id, :par_sheet_item => FactoryGirl.attributes_for(:par_sheet_item, :par_count => 111)
      @par_sheet_item.reload
    end

    it "should render json of the updated item" do
      expect(response.body).to eq @par_sheet_item.to_json
    end

  end

  describe "destroy" do

    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @par_sheet_item = @par_sheet.par_sheet_items[0]
    end

    it "should destroy the par sheet item" do
      expect{
        delete :destroy, :id => @par_sheet_item.id, :par_sheet_id => @par_sheet.id
      }.to change(ParSheetItem, :count).by -1
    end

  end

end
