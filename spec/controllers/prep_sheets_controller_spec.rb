require 'spec_helper'

describe PrepSheetsController do
  describe "new" do
    it "should return  a new prep sheet from the par sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      
      get :new, par_sheet_id: par_sheet.id

      assigns(:prep_sheet).should_not be_nil
      assigns(:par_sheet).should eq(par_sheet)
      response.should render_template(:new)
    end
  end

  describe "index" do

    before(:each) do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @prep_sheet = FactoryGirl.create(:prep_sheet, par_sheet_id: @par_sheet.id)

      get :index, par_sheet_id: @par_sheet.id
    end

    it "should return all prep sheets for a par sheet" do
      assigns(:prep_sheets).should eq([@prep_sheet])
    end
    
    it "should return the par sheet" do
      assigns(:par_sheet).should eq(@par_sheet)
    end

    it "should render index" do
      response.should render_template(:index)
    end

  end

  describe "create" do
    it "should create a new prep sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)

      post :create, par_sheet_id: par_sheet.id, prep_sheet: FactoryGirl.attributes_for(:prep_sheet, par_sheet_id: par_sheet.id)

      assigns(:prep_sheet).should_not be_nil
      response.should redirect_to par_sheet_prep_sheet_path(par_sheet, PrepSheet.last.id)
    end
  end

  describe "destroy" do
    it "should destroy the prep sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      prep_sheet = FactoryGirl.create(:prep_sheet, par_sheet_id: par_sheet.id)

      expect {
        delete :destroy, par_sheet_id: par_sheet.id, id: prep_sheet.id
      }.to change(PrepSheet, :count).by(-1)

      response.should redirect_to par_sheet_prep_sheets_url(par_sheet)
    end

    it "should not destroy a prep sheet that does not belong to the par sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      prep_sheet = FactoryGirl.create(:prep_sheet, par_sheet_id: par_sheet.id)

      expect {
        delete :destroy, par_sheet_id: par_sheet.id, id: '9'
      }.to change(PrepSheet, :count).by(0)

    end
  end

  describe "show" do
    it "should return the existing prep sheet" do
      par_sheet = FactoryGirl.create(:par_sheet)
      prep_sheet = FactoryGirl.create(:prep_sheet, par_sheet_id: par_sheet.id)

      get :show, par_sheet_id: par_sheet.id, id: prep_sheet.id

      assigns(:prep_sheet).should eq(prep_sheet)
      response.should render_template(:show)
    end
  end

end
