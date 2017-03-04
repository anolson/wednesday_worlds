class Event < ActiveRecord::Base
  belongs_to :ride
  belongs_to :route

  scope :upcoming, -> { where("begins_at > ?", Time.current.beginning_of_week).limit(2) }

  def self.this_week
    where(begins_at: Time.current.all_week).first
  end

  def self.next_week
    where(begins_at: Time.current.next_week.all_week).first
  end

  def this_week?
    during_week?(Time.current)
  end

  def next_week?
    during_week?(Time.current.next_week)
  end

  def during_week?(time)
    begins_at.between?(time.all_week.begin, time.all_week.end)
  end

  def send_notifications
    ride.notifiers.each do |notifier|
      notifier.send_notification(self)
    end
  end
end
