class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :price
      t.integer :contractor_id
      t.integer :job_id
      t.text    :comment
      t.boolean :accepted

      t.timestamps
    end
  end
end
