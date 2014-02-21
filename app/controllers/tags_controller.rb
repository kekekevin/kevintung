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
  
  private
  
  def tag_params
    params.required(:tag).permit(:name)
  end
  
end
