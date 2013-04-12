class PrepSheet < ActiveRecord::Base
  belongs_to :par_sheet

  has_many :prep_sheet_items

  def self.create_from_par_sheet(par_sheet)
    prep_sheet = PrepSheet.new

    prep_sheet.prep_sheet_items = []
    par_sheet.par_sheet_items.each do |e|
      item = PrepSheetItem.new
      item.count = e.par_count - e.count
      item.par_item_id = e.par_item_id
      prep_sheet.prep_sheet_items.push( item )
    end

    prep_sheet
  end
end
