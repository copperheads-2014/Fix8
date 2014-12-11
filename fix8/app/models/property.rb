class Property < ActiveRecord::Base

  # BUILD THIS OUT WITH CREATION VALIDATIONS
  validates :name, presence: true

  validates :address, presence: true

end
