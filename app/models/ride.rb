class Ride < ActiveRecord::Base
  has_many :notifiers
  has_many :routes, :dependent => :destroy do 
    def this_week
      all.detect do |route| 
        route.occurrence.this_week?
      end
    end
  end

  def send_notifications
    if routes.this_week
      notifiers.each do |notifier|
        notifier.send_notification
      end
    end
  end
end
