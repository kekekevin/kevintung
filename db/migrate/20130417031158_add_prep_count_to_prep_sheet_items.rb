class AddPrepCountToPrepSheetItems < ActiveRecord::Migration
  def change
    add_column :prep_sheet_items, :prep_count, :decimal
  end
end
