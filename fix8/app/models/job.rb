class Job < ActiveRecord::Base
  has_many    :bids
  has_many    :job_skills
  has_many    :skills, through: :job_skills
  belongs_to  :property


  validates :start_date, :end_date, presence: true

  def recent_bids
    bids.order(created_at: :desc)
  end

  def landlord
    property.landlord
  end

end
