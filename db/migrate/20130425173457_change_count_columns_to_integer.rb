class ChangeCountColumnsToInteger < ActiveRecord::Migration
  def up
    change_table :par_sheet_items do |t|
      t.change :par_count, :integer
    end
    change_table :prep_sheet_items do |t|
      t.change :count, :integer
      t.change :par_count, :integer
      t.change :prep_count, :integer
    end
  end

  def down
    change_table :par_sheet_items do |t|
      t.change :par_count, :decimal
    end
    change_table :prep_sheet_items do |t|
      t.change :count, :decimal
      t.change :par_count, :decimal
      t.change :prep_count, :decimal
    end

  end
end
