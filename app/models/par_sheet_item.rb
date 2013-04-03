class ParSheetItem < ActiveRecord::Base

  belongs_to :par_sheet
  belongs_to :par_item

  attr_accessible :count, :par_count, :par_item_id

  validates :par_count, presence: true, numericality: { greater_than: 0 }
  validates :count, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
