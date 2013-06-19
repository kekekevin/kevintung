class PrepSheetItem < ActiveRecord::Base

  belongs_to :prep_sheet
  belongs_to :par_item

  validates :prep_count, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }  
  validates :count, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }  
  validates :par_count, :presence => true, :numericality => { :greater_than => 0 }  

end
