class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :email
      t.string  :password_digest
      t.string  :user_type
      t.string  :address

      t.timestamps
    end
  end
end
