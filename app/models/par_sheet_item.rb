class ParSheetItem < ActiveRecord::Base

  belongs_to :par_sheet
  belongs_to :par_item

  validates :par_count, :presence => true, :numericality => { :greater_than => 0 }
  
end
