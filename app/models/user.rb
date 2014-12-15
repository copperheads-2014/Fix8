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
  validates :password, length: { minimum: 6}, on: :create
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :name, presence: true
  validates :user_type, presence: true

  enum user_type: [ :landlord, :contractor ]

  def all_jobs_i_bid_on
    job_ids = bids.pluck(:job_id).uniq
    job_ids.map { |job_id| Job.find(job_id) }
  end

  def open_jobs_i_bid_on
    open_bids = self.bids.reject { |bid| bid.accepted == true }
    open_bids.map { |bid| Job.find(bid.job.id) }
  end

  def cont_closed_jobs
    accepted_bids = self.bids.select { |bid| bid.accepted == true }
    accepted_bids.map { |bid| Job.find(bid.job.id) }
  end

  def jobs_i_can_bid_on
    Job.all - jobs_i_bid_on
  end

  def received_reviews
    if self.user_type == 'landlord'
      self.reviews_from_contractors.for_landlord
    else
      self.reviews_from_landlords.for_contractor
    end
  end
end

