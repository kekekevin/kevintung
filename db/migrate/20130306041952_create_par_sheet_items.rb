class CreateParSheetItems < ActiveRecord::Migration
  def change
    create_table :par_sheet_items do |t|
      t.decimal :par_count
      t.decimal :count
      t.references :par_sheet
      t.references :par_item

      t.timestamps
    end
    add_index :par_sheet_items, :par_sheet_id
    add_index :par_sheet_items, :par_item_id
  end
end
