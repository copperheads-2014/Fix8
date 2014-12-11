class Review < ActiveRecord::Base
  enum review_type:  [ :for_contractor, :for_landlord ]

end
