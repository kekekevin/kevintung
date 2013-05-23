class ParSheet < ActiveRecord::Base

  attr_accessible :name, :par_sheet_items, :par_sheet_items_attributes, :prep_sheets

  has_many :par_sheet_items
  has_many :prep_sheets

  validates :name, presence: true
  
  accepts_nested_attributes_for :par_sheet_items, :allow_destroy => true

end
