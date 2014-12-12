class Property < ActiveRecord::Base
  has_many    :jobs
  belongs_to  :landlord, class_name: "User", foreign_key: "owner_id"


  # BUILD THIS OUT WITH CREATION VALIDATIONS
  validates :name, presence: true

  validates :address, presence: true

end
