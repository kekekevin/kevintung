class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_active_tab

  def set_active_tab
    @active_tab = nil
  end

end
