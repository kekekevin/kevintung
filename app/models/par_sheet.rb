class ParSheet < ActiveRecord::Base

  has_many :par_sheet_items
  has_many :prep_sheets

  validates :name, presence: true
  
  accepts_nested_attributes_for :par_sheet_items, :allow_destroy => true

end
