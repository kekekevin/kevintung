class AddParCountToPrepSheetItems < ActiveRecord::Migration
  def change
    add_column :prep_sheet_items, :par_count, :decimal
  end
end
