class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name       , :limit => 30
      t.string :account_number          , :limit => 20
      t.decimal :balance ,               :precision => 10, :scale => 2
      t.string :comments , :limit => 100
      t.string :account_type   , :limit => 30
      #t.timestamps
    end
  end
end
