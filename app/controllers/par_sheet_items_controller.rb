class ParSheetItemsController < ApplicationController
  
  def index
    @par_sheet_items = ParSheetItem.find_all_by_par_sheet_id(params[:par_sheet_id])
    
    render json: @par_sheet_items
  end

  def create
    @par_sheet_item = ParSheetItem.new(params[:par_sheet_item])
    @par_sheet_item.par_sheet_id = params[:par_sheet_id]
    @par_sheet_item.save

    render json: @par_sheet_item.to_json
  end

  def update
    @par_sheet_item = ParSheetItem.update(params[:id], params[:par_sheet_item])

    render json: @par_sheet_item.to_json
  end

  def destroy
    ParSheetItem.delete(params[:id])

    render json: nil, status: :ok
  end

end
