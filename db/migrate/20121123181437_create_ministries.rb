class CreateMinistries < ActiveRecord::Migration
  def change
    create_table :ministries do |t|
      t.string :name , :limit => 30
      t.string :meeting_time, :limit=> 20
      t.string :meeting_day, :limit => 100
      t.decimal :dues_collected, :precision => 10, :scale => 2
      t.decimal :balance_avaialable   , :precision => 10, :scale => 2

      #t.timestamps
    end
  end
end
