class ParItem < ActiveRecord::Base

  attr_accessible :description, :name
  
  has_many :par_sheet_items

  validates :name, :presence => true, :uniqueness => true

end
