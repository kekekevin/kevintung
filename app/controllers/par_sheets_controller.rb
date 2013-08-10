class ParSheetsController < ApplicationController

  before_action :get_sheet, :only => [:show, :edit]

  def get_sheet
    @par_sheet = ParSheet.find(params[:id])
  end

  def set_active_tab
    @active_tab = :projects
  end
  
  def index 
    @par_sheets = ParSheet.all
  end

  def show
    respond_to do |format|
      format.html { @par_sheet }
      format.json { render :json => @par_sheet.to_json }
    end
  end

  def edit

  end

  def new
    @par_sheet = ParSheet.new
  end

  def create
    @par_sheet = ParSheet.new(par_sheet_params)
    @par_sheet.save

    redirect_to @par_sheet
  end

  def update
    @par_sheet = ParSheet.update(params[:id], par_sheet_params)

    respond_to do |format|
      format.html { redirect_to @par_sheet }
      format.json { render json: @par_sheet }
    end
  end

  def destroy
    ParSheet.destroy(params[:id])

    redirect_to par_sheet_url
  end

  private

  def par_sheet_params
    params.required(:par_sheet).permit(:name, :par_sheet_item_attributes, :prep_sheets)
  end

end
