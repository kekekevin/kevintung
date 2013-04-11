class ParItemsController < ApplicationController
  def new
    @par_item = ParItem.new
  end

  def show
    @par_item = ParItem.find_by_id(params[:id])
  end

  def create
    @par_item = ParItem.new(params[:par_item])
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
    @par_item = ParItem.update(params[:id], params[:par_item])   

    redirect_to @par_item
  end

  def destroy
    ParItem.delete(params[:id])

    redirect_to par_items_url
  end

  def index
    @par_items = ParItem.all
  end
end
