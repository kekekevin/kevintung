class ParSheet < ActiveRecord::Base
  attr_accessible :name, :par_sheet_items

  has_many :par_sheet_items

  validates :name, presence: true
  
end
