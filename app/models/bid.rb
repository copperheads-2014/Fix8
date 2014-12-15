class Bid < ActiveRecord::Base
  has_many    :reviews
  belongs_to  :contractor, class_name: "User"
  belongs_to  :job

  validates :contractor_id, presence: true
  validates :job_id, presence: true
  validates :price, presence: true, numericality: true

  validate :less_than_max_bid, :bidder_is_contractor


  def less_than_max_bid
    errors.add(:price, "is above the max bid") if self.job.max_bid < self.price
  end

  def bidder_is_contractor
    errors.add(:contractor_id, "must be an user that is a contractor") if self.contractor.user_type == 1
  end
end
