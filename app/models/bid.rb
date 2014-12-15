class Bid < ActiveRecord::Base
  has_many    :reviews
  belongs_to  :contractor, class_name: "User"
  belongs_to  :job

  validates :contractor_id, presence: true
  validates :job_id, presence: true
  validates :price, presence: true, numericality: true

  before_validation :less_than_max_bid


  def less_than_max_bid
    self.job.max_bid > self.price
  end
end
