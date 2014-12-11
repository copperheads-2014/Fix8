class Bid < ActiveRecord::Base
  enum status: [:pending, :rejected, :accepted]
end
