class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.references :account
      t.string :name , :limit => 30
      t.decimal :limit, :precision => 8, :scale => 2   ,  :default => 0.00
      t.date :start_date
      t.date :end_date
      t.decimal :allocated_amount , :precision => 8, :scale => 2 ,  :default => 0.00
      t.references :event

      #t.timestamps
    end
    add_index :budgets, :account_id
    add_index :budgets, :event_id
  end
end
