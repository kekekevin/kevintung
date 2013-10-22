class PrepSheet < ActiveRecord::Base

  belongs_to :par_sheet

  has_many :prep_sheet_items, :dependent => :destroy

  accepts_nested_attributes_for :prep_sheet_items

  def self.new_from_par_sheet(par_sheet)
    prep_sheet = par_sheet.prep_sheets.new
    prep_sheet.prep_sheet_items = []
    
    par_sheet.par_sheet_items.each do |i|
      item = prep_sheet.prep_sheet_items.new
      item.par_count = i.par_count
      item.count = 0
      item.par_item = i.par_item
    end

    prep_sheet
  end

  def self.make_calculated_prep_sheet(prep_sheet_attributes)
    prep_sheet = PrepSheet.new(prep_sheet_attributes)
    
    prep_sheet.prep_sheet_items.each { |i| i.prep_count = i.par_count - i.count }

    prep_sheet
  end

  def to_csv
    export = CSV.generate do |csv|
      csv << ["count", "item"]
    end
    export << prep_sheet_items.to_csv
  end

end
