class CreatePerformersSlotsJoinTable < ActiveRecord::Migration

  def change
    create_table :performers_slots do |t|
      t.references :slot
      t.references :performer
    end

    add_index :performers_slots, :slot_id
    add_index :performers_slots, :performer_id
  end

end
