class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :member
      t.decimal :amount , :precision => 8, :scale => 2
      t.date :date_given
      t.string :donation_type , :limit => 20

      #t.timestamps
    end
    add_index :donations, :member_id
  end
end
