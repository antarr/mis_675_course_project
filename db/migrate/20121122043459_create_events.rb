class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name, :limit => 50
      t.decimal :estimated_cost   , :precision => 8, :scale => 2
      t.decimal :actual_cost     , :precision => 8, :scale => 2
      t.string :comments, :limit => 255

      #t.timestamps
    end
  end
end
