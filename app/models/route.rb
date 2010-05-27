class Route < ActiveRecord::Base
  
  belongs_to :ride
  
  def self.find_this_weeks_route
    today = Date.today
    Route.where(["begins_at > :start AND begins_at < :end", 
      {:start => today.beginning_of_week, :end => today.end_of_week}]).first
  end
  
end
