class PrepSheetItem < ActiveRecord::Base
  belongs_to :prep_sheet
  belongs_to :par_item

  attr_accessible :count

  validates :count, presence: true, numericality: { greater_than: 0 }  
end
