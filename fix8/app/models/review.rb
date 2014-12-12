class Review < ActiveRecord::Base
  enum review_type:  [ :for_contractor, :for_landlord ]

  belongs_to  :bid

  validates :bid_id, presence: true
  validates :review_type, presence: true
  validates_uniqueness_of :bid_id, scope: :review_type
  validates :rating, :inclusion => {:in => [0,1,2,3,4,5,6,7,8,9,10]}, presence: true

end
