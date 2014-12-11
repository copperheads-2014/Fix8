class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :property_id
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :max_bid
      t.integer :bid_length
      t.timestamps
    end
  end
end
