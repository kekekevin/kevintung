class StaticController < ApplicationController

  def set_active_tab
    @active_tab = params[:action] 
  end

end
