class ParSheetsController < ApplicationController

  def set_active_tab
    @active_tab = :projects
  end
  
  def index 
    @par_sheets = ParSheet.all
  end

  def show
    @par_sheet = ParSheet.find_by_id(params[:id])

    respond_to do |format|
      format.html { @par_sheet }
      format.json { render json: @par_sheet.to_json }
    end
  end

  def edit
    @par_sheet = ParSheet.find_by_id(params[:id])
  end

  def new
    @par_sheet = ParSheet.new
  end

  def create
    @par_sheet = ParSheet.new(params[:par_sheet])
    @par_sheet.save

    redirect_to @par_sheet
  end

  def update
    @par_sheet = ParSheet.update(params[:id], params[:par_sheet])

    respond_to do |format|
      format.html { redirect_to @par_sheet }
      format.json { render json: @par_sheet }
    end
  end

  def destroy
    ParSheet.destroy(params[:id])

    redirect_to par_sheet_url
  end

end
