class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name,  :limit => 30
      t.string :last_name,  :limit => 30
      t.string :address,    :limit => 100
      t.string :city,       :limit => 20
      t.string :state,      :limit => 2
      t.string :zipcode,    :limit => 10  , :default => '00000-0000'
      t.string :phone_number, :limit => 13, :default => '000-000-0000'
      t.string :email, :limit => 35

      #t.timestamps
    end
  end
end
