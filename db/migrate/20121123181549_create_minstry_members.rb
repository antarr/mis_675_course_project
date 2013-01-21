class CreateMinstryMembers < ActiveRecord::Migration
  def change
    create_table :minstry_members, :id => false do |t|
      t.references :ministry
      t.references :member
      t.string :position, :limit => 35

      #t.timestamps
    end
    add_index :minstry_members, :ministry_id
    add_index :minstry_members, :member_id
  end
end
