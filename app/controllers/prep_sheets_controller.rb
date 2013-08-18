class PrepSheetsController < ApplicationController

  def set_active_tab
    @active_tab = :projects
  end
  
  def index
    @par_sheet = ParSheet.find(params[:par_sheet_id])

    @prep_sheets = @par_sheet.prep_sheets
  end

  def create
    @prep_sheet = PrepSheet.make_calculated_prep_sheet(prep_sheet_params)
    @prep_sheet.save
    
    redirect_to par_sheet_prep_sheet_path(@prep_sheet.par_sheet.id, @prep_sheet.id)
  end

  def new
    @par_sheet = ParSheet.find(params[:par_sheet_id])

    @prep_sheet = PrepSheet.new_from_par_sheet(@par_sheet)
  end

  def destroy
    @par_sheet = ParSheet.find(params[:par_sheet_id])

    @par_sheet.prep_sheets.find(params[:id]).destroy if @par_sheet.prep_sheets.exists?(params[:id])

    redirect_to par_sheet_prep_sheets_url(@par_sheet)
  end

  def show
    @prep_sheet = PrepSheet.find(params[:id])
  end

  private

  def prep_sheet_params
    params.required(:prep_sheet).permit(:par_sheet_id, :prep_sheet_item_attributes)
  end

end
