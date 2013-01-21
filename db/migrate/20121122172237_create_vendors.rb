class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name , :limit => 75
      t.string :address , :limit => 100
      t.string :city, :limit => 25
      t.string :state, :limit => 2
      t.string :zipcode, :limit => 10
      t.string :phone_number, :limit => 13
      t.string :email, :limit => 35

      #t.timestamps
    end
  end
end
