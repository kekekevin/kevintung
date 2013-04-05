class ParSheetItemsController < ApplicationController

  def destroy
    ParSheetItem.delete(params[:id])

    respond_to do |format|
      format.json { head :ok }
    end
  end

  def create
    @par_sheet_item = ParSheetItem.new(params[:par_sheet_item])
    @par_sheet_item.save

    respond_to do |format|
      format.json { render json: @par_sheet_item }
    end
  end 

  def update
    ParSheetItem.update(params[:id], params[:par_sheet_item])

    respond_to do |format|
      format.json { head :ok }
    end
  end

end

