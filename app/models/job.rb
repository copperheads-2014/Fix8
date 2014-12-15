class Job < ActiveRecord::Base
  has_many    :bids
  has_many    :job_skills
  has_many    :skills, through: :job_skills
  belongs_to  :property


  validates :start_date, :end_date, presence: true
  validate :end_is_after_start

  def end_is_after_start
    errors.add(:end_date, "must come after start date") if self.end_date < self.start_date
  end

  def recent_bids
    bids.order(created_at: :desc)
  end

  def landlord
    property.landlord
  end

  def accepted_bid?
    self.bids.where(accepted: true).count >= 1
  end

  def find_accepted_bid
    self.bids.where(accepted:true)[0]
  end

  def expired?
    Time.now > self.created_at + self.bid_length.day
  end

end
