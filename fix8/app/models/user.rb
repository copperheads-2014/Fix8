class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
  enum user_type: [ :Landlord, :Contractor ]
end
