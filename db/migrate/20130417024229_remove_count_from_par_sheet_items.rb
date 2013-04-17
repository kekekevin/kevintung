class RemoveCountFromParSheetItems < ActiveRecord::Migration
  def up
    remove_column :par_sheet_items, :count
  end

  def down
    add_column :par_sheet_items, :count, :decimal
  end
end
