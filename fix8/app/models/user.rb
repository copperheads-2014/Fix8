class User < ActiveRecord::Base
  has_secure_password
  validates :password, length: { minimum: 6}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  enum user_type: [ :Landlord, :Contractor ]
end
