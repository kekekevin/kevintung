class ParSheetsController < ApplicationController

  respond_to :html, :json

  def index 
    @par_sheets = ParSheet.all
  end

  def show
    @par_sheet = ParSheet.find(params[:id])

    respond_with(@par_sheet)
  end

  def edit
    @par_sheet = ParSheet.find(params[:id])
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

    respond_with(@par_sheet)
  end

  def destroy
    ParSheet.destroy(params[:id])

    redirect_to par_sheets_url
  end

  private

  def par_sheet_params
    params.required(:par_sheet).permit(:name, :par_sheet_item_attributes, :prep_sheets)
  end

end
