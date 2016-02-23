class Ride < ActiveRecord::Base
  has_many :notifiers
  has_many :events
end
