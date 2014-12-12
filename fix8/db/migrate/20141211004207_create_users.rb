class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :email
      t.string    :name
      t.string    :password_digest
      t.integer   :user_type, default: 0 #enum, landlord: 0; contractor: 1
      t.text      :address
      t.string    :phone_number

      t.timestamps
    end
    add_index :users, :email, uniqueness: true
  end
end
