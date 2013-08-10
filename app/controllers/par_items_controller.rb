class ParItemsController < ApplicationController

  before_action :get_item, :only => [:show, :edit]

  def get_item
    @par_item = ParItem.find(params[:id])
  end

  def set_active_tab
    @active_tab = :projects
  end

  def new
    @par_item = ParItem.new
  end

  def show
    
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
