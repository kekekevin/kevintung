require "spec_helper"

describe PrepSheetsController do

  describe "new" do

    it "should return a new prep sheet from the par sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      
      get :new, :par_sheet_id => par_sheet.id

      expect(assigns(:prep_sheet)).not_to be_nil
      expect(assigns(:par_sheet)).to eq(par_sheet)
      expect(response).to render_template(:new)
    end

  end

  describe "index" do

    before(:each) do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @prep_sheet = FactoryGirl.create(:prep_sheet, :par_sheet_id => @par_sheet.id)

      get :index, :par_sheet_id => @par_sheet.id
    end

    it "should return all prep sheets for a par sheet" do
      expect(assigns(:prep_sheets)).to eq([@prep_sheet])
    end
    
    it "should return the par sheet" do
      expect(assigns(:par_sheet)).to eq(@par_sheet)
    end

    it "should render index" do
      expect(response).to render_template(:index)
    end

  end

  describe "create" do

    it "should create a new prep sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)

      post :create, :par_sheet_id => par_sheet.id, :prep_sheet => FactoryGirl.attributes_for(:prep_sheet, :par_sheet_id => par_sheet.id)

      expect(assigns(:prep_sheet)).not_to be_nil
      expect(response).to redirect_to par_sheet_prep_sheet_path(par_sheet, PrepSheet.last.id)
    end

  end

  describe "destroy" do

    it "should destroy the prep sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      prep_sheet = FactoryGirl.create(:prep_sheet, :par_sheet_id => par_sheet.id)

      expect {
        delete :destroy, :par_sheet_id => par_sheet.id, :id => prep_sheet.id
      }.to change(PrepSheet, :count).by(-1)

      expect(response).to redirect_to par_sheet_prep_sheets_url(par_sheet)
    end

    it "should not destroy a prep sheet that does not belong to the par sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      prep_sheet = FactoryGirl.create(:prep_sheet, :par_sheet_id => par_sheet.id)

      expect {
        delete :destroy, :par_sheet_id => par_sheet.id, :id => "9"
      }.to change(PrepSheet, :count).by(0)
    end

  end

  describe "show" do

    before(:each) do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @prep_sheet = FactoryGirl.create(:prep_sheet, :par_sheet_id => @par_sheet.id)
      @prep_sheet_item = FactoryGirl.create(:prep_sheet_item, :prep_sheet_id => @prep_sheet.id, :par_item_id => 1)
    end

    it "should return the existing prep sheet" do
      get :show, :par_sheet_id => @par_sheet.id, :id => @prep_sheet.id

      expect(assigns(:prep_sheet)).to eq(@prep_sheet)
      expect(response).to render_template(:show)
    end

    it "should export to csv format" do
      get :show, :par_sheet_id => @par_sheet.id, :id => @prep_sheet.id, :format => :csv

      expect(response.body).to eq("count,item\n#{@prep_sheet_item.count},#{@prep_sheet_item.par_item.name}\n")
    end

  end

end
