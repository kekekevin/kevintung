class TagsController < ApplicationController
  
  def new
    @tag = Tag.new
  end
  
  def create
    @tag = Tag.new(tag_params)
    @tag.save
    
    redirect_to tags_url
  end
  
  def destroy
    Tag.find(params[:id]).destroy
    
    redirect_to tags_url
  end
  
  def edit
    @tag = Tag.find params[:id]
  end
  
  def update
    Tag.update(params[:id], tag_params)
    
    redirect_to tags_url
  end
  
  def index
    @tags = Tag.all
  end
  
  private
  
  def tag_params
    params.required(:tag).permit(:name)
  end
  
end
