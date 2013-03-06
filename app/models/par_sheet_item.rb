class ParSheetItem < ActiveRecord::Base
  belongs_to :par_sheet
  belongs_to :par_item
  attr_accessible :count, :par_count
end
