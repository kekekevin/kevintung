require "spec_helper" 

describe ParSheetsController do 

  it "should get all par sheets" do 
    par_sheet = FactoryGirl.create(:par_sheet) 
    
    get :index 
    
    expect(assigns(:par_sheets)).to eq([par_sheet])
    expect(response).to render_template(:index)
  end

  describe "show" do

    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
    end

    it "should retrieve an existing par sheet" do
      get :show, :id => @par_sheet.id

      expect(assigns(:par_sheet)).to eq(@par_sheet)
      expect(response).to render_template(:show)
    end

    it "should respond to json requests" do
      get :show, :id => @par_sheet.id, :format => :json

      expect(response.body).to eq(@par_sheet.to_json)
    end

  end
  
  describe "edit" do

    before do
      @par_sheet = FactoryGirl.create(:par_sheet)
    end

    it "should retrieve an existing par sheet to edit" do
      get :edit, :id => @par_sheet.id

      expect(assigns(:par_sheet)).to eq @par_sheet
      expect(response).to render_template(:edit)
    end

  end

  it "should create a new sheet" do
    get :new

    expect(assigns(:par_sheet)).to be_a_new(ParSheet)
    expect(response).to render_template(:new)
  end

  it "should create an par sheet from attributes" do
    expect {
      post :create, :par_sheet => FactoryGirl.attributes_for(:par_sheet)
    }.to change(ParSheet, :count).by(1)

    expect(assigns(:par_sheet)).not_to be_nil
    expect(response).to redirect_to(ParSheet.last)
  end

  describe "update" do

    before(:each) do
      @par_sheet = FactoryGirl.create(:par_sheet, :name => "existing")
      @par_sheet.par_sheet_items[0].par_count = "3"
    end

    it "should update an existing par sheet" do
      put :update, :id => @par_sheet.id, :par_sheet => FactoryGirl.attributes_for(:par_sheet)

      expect(assigns(:par_sheet)).not_to be_nil
      expect(response).to redirect_to(@par_sheet)
      @par_sheet.reload
      expect(@par_sheet.name).not_to eq "existing"
      expect(@par_sheet.par_sheet_items[0].par_count).not_to eq "3"
    end

    it "should respond to json" do
      put :update, :id => @par_sheet.id, :par_sheet => FactoryGirl.attributes_for(:par_sheet), :format => :json

      expect(response.body).to eq ParSheet.last.to_json
    end

  end

  it "should destroy an existing par sheet" do
    par_sheet = FactoryGirl.create(:par_sheet)

    expect{
      delete :destroy, :id => par_sheet.id
    }.to change(ParSheet, :count).by(-1)

    expect(response).to redirect_to par_sheet_url
  end

end


