class Route < ActiveRecord::Base
  
  belongs_to :ride
  
  # def self.find_this_weeks_route
  #   today = Date.today
  #   Route.where(["begins_at > :start AND begins_at < :end", 
  #     {:start => today.beginning_of_week, :end => today.end_of_week}]).first
  # end
  
  def self.this_week
    today = Date.today
    (today.beginning_of_week..today.end_of_week)
  end
  
  def occurs_this_week?
    this_week = Route.this_week
    return true if((self.begins_at > this_week.begin) and (self.begins_at < this_week.end))
  end
  
end
