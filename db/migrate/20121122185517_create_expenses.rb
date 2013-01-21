class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name    , :limit => 30
      t.string :description    , :limit => 255
      t.decimal :amount     , :precision => 8, :scale => 2
      t.references :account
      t.date :date_of
      #t.timestamps
    end
    add_index :expenses, :account_id
  end
end
