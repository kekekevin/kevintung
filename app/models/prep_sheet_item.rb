class PrepSheetItem < ActiveRecord::Base
  belongs_to :prep_sheet
  belongs_to :par_item

  attr_accessible :count
end
