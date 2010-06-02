class Route < ActiveRecord::Base
  belongs_to :ride
  has_one :recurrence
end
