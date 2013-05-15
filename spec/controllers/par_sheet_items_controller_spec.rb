require 'spec_helper'


describe ParSheetItemsController do
  describe 'index' do
    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @par_sheet_item = @par_sheet.par_sheet_items[0]
    end

    it 'should return all par sheet items' do
      get :index, par_sheet_id: @par_sheet.id, format: :json

      response.body.should == [@par_sheet_item].to_json
    end
  end

  describe 'update' do
    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @par_sheet_item = @par_sheet.par_sheet_items[0]

      put :update, id: @par_sheet_item.id, par_sheet_id: @par_sheet.id, par_sheet_item: FactoryGirl.attributes_for(:par_sheet_item, par_count: 111)
      @par_sheet_item.reload
    end

    it 'should render json of the updated item' do
      response.body.should == @par_sheet_item.to_json
    end
  end

  describe 'destroy' do
    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
      @par_sheet_item = @par_sheet.par_sheet_items[0]
    end

    it 'should destroy the par sheet item' do
      expect{
        delete :destroy, id: @par_sheet_item.id, par_sheet_id: @par_sheet.id
      }.to change(ParSheetItem, :count).by -1
    end
  end

end
