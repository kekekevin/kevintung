class PrepSheetsController < ApplicationController
  
  def index
    @prep_sheets = ParSheet.find(params[:par_sheet_id]).prep_sheets
  end

  def create
    par_sheet = ParSheet.find(params[:par_sheet_id])

    @prep_sheet = PrepSheet.new_from_par_sheet(par_sheet)
    @prep_sheet.save
    redirect_to par_sheet_prep_sheet_path(par_sheet.id, @prep_sheet.id)
  end

  def destroy
    @par_sheet = ParSheet.find(params[:par_sheet_id])

    PrepSheet.find_by_id_and_par_sheet_id(params[:id], params[:par_sheet_id]).try(:destroy)

    redirect_to par_sheet_prep_sheets_url(@par_sheet)
  end

  def show
    @prep_sheet = PrepSheet.find(params[:id])
  end

end