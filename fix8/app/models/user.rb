class User < ActiveRecord::Base
  has_many  :bids, foreign_key: "contractor_id"
  has_many  :user_skills
  has_many  :skills, through: :user_skills
  has_many  :properties, foreign_key: "owner_id"
  has_many  :jobs, through: :properties

  # need to add two 'through' review associations.

  has_secure_password
  validates :password, length: { minimum: 6}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  validates :address, presence: true
  enum user_type: [ :Landlord, :Contractor ]
end
