require 'spec_helper' 

describe ParSheetsController do 
  it 'should get all par sheets' do 
    par_sheet = FactoryGirl.create(:par_sheet) 
    
    get :index 
    
    assigns(:par_sheets).should eq([par_sheet])
    response.should render_template(:index)
  end

  it 'should retrieve an existing par sheet' do
    par_sheet = FactoryGirl.create(:par_sheet)

    get :show, id: par_sheet.id

    assigns(:par_sheet).should eq(par_sheet)
    response.should render_template(:show)
  end
  
  it 'should retrieve an existing par sheet to edit' do
    par_sheet = FactoryGirl.create(:par_sheet)

    get :edit, id: par_sheet.id

    assigns(:par_sheet).should eq(par_sheet)
    response.should render_template(:edit)
  end

  it 'should create a new sheet' do
    ParSheet.should_receive(:new)

    get :new

    assigns(:par_sheet)
    response.should render_template(:new)
  end

  it 'should create an par sheet from attributes' do
    expect {
      post :create, par_sheet: FactoryGirl.attributes_for(:par_sheet)
    }.to change(ParSheet, :count).by(1)

    assigns(:par_sheet)
    response.should redirect_to(ParSheet.last)
  end

  it 'should update an existing par sheet' do
    par_sheet = FactoryGirl.create(:par_sheet, name: 'existing')
    par_sheet.par_sheet_items[0].count = '3'

    put :update, id: par_sheet.id, par_sheet: FactoryGirl.attributes_for(:par_sheet)
    
    assigns(:par_sheet)
    response.should redirect_to(par_sheet)
    par_sheet.reload
    par_sheet.name.should_not eq('existing')
    par_sheet.par_sheet_items[0].count.should_not eq('3')
  end

  it 'should destroy an existing par sheet' do
    par_sheet = FactoryGirl.create(:par_sheet)

    expect{
      delete :destroy, id: par_sheet.id
    }.to change(ParSheet, :count).by(-1)

    response.should redirect_to par_sheet_url
  end

end

