class Review < ActiveRecord::Base
  enum review_for: [:landlord, :contractor]

  belongs_to :bid

  validates :bid, presence: true, uniqueness: {scope: :review_for}
  validates :review_for, presence: true
  validates :rating, inclusion: {in: [0,1,2,3,4,5,6,7,8,9,10]}, presence: true

  scope :for_contractor, -> { where(review_for: 1) }
  scope :for_landlord,   -> { where(review_for: 0) }
end
