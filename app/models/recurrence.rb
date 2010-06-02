class Recurrence < ActiveRecord::Base
  belongs_to :route
  
  def dates
    @dates ||= build_dates
  end
  
  def this_weeks_date
    dates.each do |date|
      return date if date_occurs_during_week?(date, Recurrence.this_week)
    end
    return nil
  end
  
  
  def self.this_week
    today = Date.today
    (today.beginning_of_week..today.end_of_week)
  end
  
  def occurs_this_week?
    dates.each do |date|
      return true if date_occurs_during_week?(date, Recurrence.this_week)
    end
    return false
  end
  
  def date_occurs_during_week?(date, week)
    return ((date > week.begin) and (date < week.end))
  end
  
  private 
  
  def build_dates
    dates = Array.new
    date = self.recurrence_begins_on
    while(date <= self.recurrence_ends_on)
      dates << date
      date = 1.week.since(date)
    end
    dates
  end

  
end

