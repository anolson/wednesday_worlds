class Route < ActiveRecord::Base
  has_many :events
  has_one :occurrence, :dependent => :destroy

  accepts_nested_attributes_for :occurrence
end
