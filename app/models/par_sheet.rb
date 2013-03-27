class ParSheet < ActiveRecord::Base
  attr_accessible :name, :par_sheet_items, :par_sheet_items_attributes

  has_many :par_sheet_items

  validates :name, presence: true
  
  accepts_nested_attributes_for :par_sheet_items
end
