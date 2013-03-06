class CreateParSheets < ActiveRecord::Migration
  def change
    create_table :par_sheets do |t|
      t.string :name

      t.timestamps
    end
  end
end
