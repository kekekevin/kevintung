class PrepSheet < ActiveRecord::Base
  belongs_to :par_sheet

  has_many :prep_sheet_items

end
