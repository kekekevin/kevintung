class ParItemsController < ApplicationController

  def set_active_tab
    @active_tab = :projects
  end

  def new
    @par_item = ParItem.new
  end

  def show
    @par_item = ParItem.find_by_id(params[:id])
  end

  def create
    @par_item = ParItem.new(par_item_params)
    @par_item.save

    respond_to do |format|
      format.html { redirect_to @par_item }
      format.json { render json: @par_item }
    end
  end

  def edit
    @par_item = ParItem.find_by_id(params[:id])
  end

  def update
    @par_item = ParItem.update(params[:id], par_item_params)   

    redirect_to @par_item
  end

  def destroy
    ParItem.delete(params[:id])

    redirect_to par_items_url
  end

  def index
    @par_items = ParItem.all

    respond_to do |format|
      format.html { @par_items }
      format.json { render json: @par_items }
    end
  end

  private
    
  def par_item_params
    params.required(:par_item).permit(:name, :description)
  end

end
