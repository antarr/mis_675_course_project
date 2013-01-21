class CreateBudgetItems < ActiveRecord::Migration
  def change
    create_table :budget_items do |t|
      t.string :title  ,  :limit => 30
      t.decimal :cost_per,  :precision => 8, :scale => 2
      t.integer :quantity
      t.references :budget

      #t.timestamps
    end
    add_index :budget_items, :budget_id
  end
end
