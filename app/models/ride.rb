class Ride < ApplicationRecord
  has_many :notifiers
  has_many :events
end
