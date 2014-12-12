class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text      :description
      t.integer   :rating
      t.integer   :bid_id
      t.integer   :review_for, default: 0 #enum

      t.timestamps
    end
  end
end
