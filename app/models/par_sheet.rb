class ParSheet < ActiveRecord::Base
  attr_accessible :name

  has_many :par_sheet_items

  validates :name, presence: true
end
