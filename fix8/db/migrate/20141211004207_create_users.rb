class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :email
      t.string    :name
      t.string    :password_hash
      t.integer   :user_type, default: 0 #enum, Landlord: 0; Contractor: 1
      t.text      :address
      t.string    :phone_number

      t.timestamps
    end
  end
end
