class ParSheetItemsController < ApplicationController
  
  def index
    @par_sheet_items = ParSheetItem.find_all_by_par_sheet_id(params[:par_sheet_id])
    
    render json: @par_sheet_items
  end

  def update
    @par_sheet_item = ParSheetItem.update(params[:id], params[:par_sheet_item])

    render json: @par_sheet_item.to_json
  end

  def destroy
    ParSheetItem.delete(params[:id])

    render json: {}
  end

end
