class CreatePrepSheetItems < ActiveRecord::Migration
  def change
    create_table :prep_sheet_items do |t|
      t.references :prep_sheet
      t.decimal :count
      t.references :par_item

      t.timestamps
    end
    add_index :prep_sheet_items, :prep_sheet_id
    add_index :prep_sheet_items, :par_item_id
  end
end
