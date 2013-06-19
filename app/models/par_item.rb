class ParItem < ActiveRecord::Base

  has_many :par_sheet_items

  validates :name, :presence => true, :uniqueness => true

end
