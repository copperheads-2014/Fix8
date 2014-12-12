class Bid < ActiveRecord::Base
  has_many    :reviews
  belongs_to  :contractor, class_name: "User"
  belongs_to  :job
  enum status: [ :pending, :accepted ]
end
