class ParSheetItemsController < ApplicationController
  
  def index
    @par_sheet_items = ParSheetItem.where :par_sheet_id => params[:par_sheet_id]
    
    render json: @par_sheet_items
  end

  def create
    @par_sheet_item = ParSheetItem.new(par_sheet_item_params)
    @par_sheet_item.par_sheet_id = params[:par_sheet_id]
    @par_sheet_item.save

    render :json => @par_sheet_item.to_json
  end

  def update
    @par_sheet_item = ParSheetItem.update(params[:id], par_sheet_item_params)

    render json: @par_sheet_item.to_json
  end

  def destroy
    ParSheetItem.delete(params[:id])

    render :json => nil, :status => :ok
  end

  private

  def par_sheet_item_params
    params.required(:par_sheet_item).permit(:par_count, :par_item_id)
  end

end
