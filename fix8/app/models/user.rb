class User < ActiveRecord::Base
  has_many  :bids, foreign_key: "contractor_id"
  has_many  :user_skills
  has_many  :skills, through: :user_skills
  has_many  :properties, foreign_key: "owner_id"
  has_many  :jobs, through: :properties
  has_many :received_bids, through: :jobs, source: :bids
  has_many :reviews_from_contractors, through: :received_bids, source: :reviews
  has_many :reviews_from_landlords, through: :bids, source: :reviews


  has_secure_password
  validates :password, length: { minimum: 6}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :name, presence: true
  enum user_type: [ :landlord, :contractor ]

  def received_reviews
    if self.user_type == 0
      self.reviews_from_contractors.for_landlord
    else
      self.reviews_from_landlords.for_contractor
    end
  end
end

