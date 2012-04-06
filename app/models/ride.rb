class Ride < ActiveRecord::Base
  has_many :routes, :dependent => :destroy do 
    def this_week
      all.detect do |route| 
        route.occurrence.this_week?
      end
    end
  end  
end
