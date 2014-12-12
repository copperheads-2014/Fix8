class Bid < ActiveRecord::Base
  has_many    :reviews
  belongs_to  :contractor, class_name: "User"
  belongs_to  :job
  enum status: [ :pending, :accepted ]

  validates :contractor_id, presence: true
  validates :job_id, presence: true
  validates :price, presence: true, numericality: true

end
