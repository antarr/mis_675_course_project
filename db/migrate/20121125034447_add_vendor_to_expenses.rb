class AddVendorToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :vendor_id, :integer
    add_index :expenses, :vendor_id
  end
end
