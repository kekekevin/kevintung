class CreateParItems < ActiveRecord::Migration
  def change
    create_table :par_items do |t|
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
