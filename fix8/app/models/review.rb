class Review < ActiveRecord::Base
  belongs_to  :bid

  enum review_type:  [ :for_contractor, :for_landlord ]

end
