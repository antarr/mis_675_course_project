class CreateEventMembers < ActiveRecord::Migration
  def change
    create_table :event_members, :id => false do |t|
      t.references :event
      t.references :member

      #t.timestamps
    end
    add_index :event_members, :event_id
    add_index :event_members, :member_id
  end
end
