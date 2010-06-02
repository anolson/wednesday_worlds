class Route < ActiveRecord::Base
  belongs_to :ride
  has_one :occurrence
end
