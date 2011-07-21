class Route < ActiveRecord::Base
  belongs_to :ride
  has_one :occurrence, :dependent => :destroy

  accepts_nested_attributes_for :occurrence
end
