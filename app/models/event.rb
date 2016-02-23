class Event < ActiveRecord::Base
  belongs_to :ride
  belongs_to :route

  def self.this_week
    where(begins_at: all_week(Time.current)).first
  end

  def self.next_week
    where(begins_at: all_week(1.week.from_now)).first
  end

  def self.all_week(time)
    time.beginning_of_week..time.end_of_week
  end

  def this_week?
    self == self.class.this_week
  end

  def next_week?
    self == self.class.next_week
  end

  def send_notifications
    ride.notifiers.each do |notifier|
      notifier.send_notification
    end
  end
end
