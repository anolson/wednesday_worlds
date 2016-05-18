class RideTweet
  include ApplicationHelper
  attr_accessor :event

  def initialize(event)
    @event = event
  end

  def to_s
    %(#{date}. #{location}. #{time}. #{route}.)
  end

  def date
    format_date(event.begins_at)
  end

  def location
    event.ride.location
  end

  def time
    format_time(event.begins_at)
  end

  def route
    event.route.name
  end
end
