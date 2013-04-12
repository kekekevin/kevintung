class CreatePrepSheets < ActiveRecord::Migration
  def change
    create_table :prep_sheets do |t|
      t.references :par_sheet

      t.timestamps
    end
    add_index :prep_sheets, :par_sheet_id
  end
end
