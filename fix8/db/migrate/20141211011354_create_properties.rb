class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer   :owner_id
      t.string    :name
      t.text      :address

      t.timestamps
    end
  end
end
