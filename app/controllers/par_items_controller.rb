class ParItemsController < ApplicationController

  respond_to :html, :json

  def new
    @par_item = ParItem.new
  end

  def show
    @par_item = ParItem.find(params[:id])
  end

  def create
    @par_item = ParItem.new(par_item_params)
    @par_item.save

    respond_with(@par_item)
  end

  def edit
    @par_item = ParItem.find(params[:id])
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

    respond_with @par_items
  end

  private
    
  def par_item_params
    params.required(:par_item).permit(:name, :description)
  end

end
