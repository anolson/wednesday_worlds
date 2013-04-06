class RideTweet
  attr_accessor :ride

  def initialize(ride)
    @ride = ride
  end

  def to_s
    %(#{date}. #{location}. #{time}. #{route}.)
  end

  def date
    format_date(this_week.occurrence.next_date)
  end

  def location
    ride.location
  end

  def time
    format_time(this_week.occurrence.begins_at)
  end

  def route
    this_week.name
  end

  def this_week
    ride.routes.this_week
  end
end