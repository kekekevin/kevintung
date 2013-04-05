require 'spec_helper'

describe ParSheetItemsController do
  
  describe 'destroy' do
    
    it 'should destroy a par sheet item' do
      par_sheet_item = FactoryGirl.create(:par_sheet_item)

      expect {
        delete :destroy, { id: par_sheet_item.id, format: :json }
      }.to change(ParSheetItem, :count).by(-1)
    end

    it 'should return an ok response' do
      par_sheet_item = FactoryGirl.create(:par_sheet_item)

      delete :destroy, { id: par_sheet_item.id, format: :json }

      response.code.should == "200"
    end
  end

  describe 'create' do

    it 'should create a new par sheet item' do
      expect{
        post :create, { par_sheet_item: FactoryGirl.attributes_for(:par_sheet_item), format: :json }
      }.to change(ParSheetItem, :count).by(1)
    end

    it 'should respond with the created object json' do
      post :create, { par_sheet_item: FactoryGirl.attributes_for(:par_sheet_item), format: :json }

      response.body.should == ParSheetItem.last.to_json 
    end

  end

  describe 'update' do

    it 'should update an existing par sheet item' do
      par_sheet_item = FactoryGirl.create(:par_sheet_item)
      par_sheet_item.count = '99'

      put :update, { id: par_sheet_item.id, par_sheet_item: FactoryGirl.attributes_for(:par_sheet_item), format: :json }

      par_sheet_item.reload
      par_sheet_item.count.should_not == '99'
    end

    it 'should responsd with an ok' do
      par_sheet_item = FactoryGirl.create(:par_sheet_item)

      put :update, { id: par_sheet_item.id, par_sheet_item: FactoryGirl.attributes_for(:par_sheet_item), format: :json }

      response.code.should == "200"
    end

  end
end
