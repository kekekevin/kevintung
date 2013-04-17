class PrepSheet < ActiveRecord::Base
  belongs_to :par_sheet

  has_many :prep_sheet_items

  def self.new_from_par_sheet(par_sheet)
    prep_sheet = PrepSheet.new
    prep_sheet.par_sheet = par_sheet

    prep_sheet.prep_sheet_items = []

    par_sheet.par_sheet_items.each do |e|
      calculated_count = e.par_count - e.count
      if(calculated_count != 0)
        item = PrepSheetItem.new
        item.count = calculated_count
        item.par_item = e.par_item
        prep_sheet.prep_sheet_items.push( item )
      end
    end

    prep_sheet
  end
end
