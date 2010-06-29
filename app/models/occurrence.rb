class Occurrence < ActiveRecord::Base
  belongs_to :route
  
  def self.this_week
    today = Date.today
    (today.beginning_of_week..today.end_of_week)
  end
  
  def dates
    @dates ||= build_dates
  end
  
  def date_occurs_during_this_week?(date)
    return date_occurs_during_week?(date, Occurrence.this_week)
  end
  
  def date_occurs_during_week?(date, week)
    return ((date > week.begin) and (date < week.end))
  end

  def occurs_this_week?
    dates.each do |date|
      return true if date_occurs_during_this_week?(date)
    end
    return false
  end

  def this_weeks_date
    dates.each do |date|
      return date if date_occurs_during_this_week?(date)
    end
    return nil
  end
    
  private 
  def build_dates
    dates = [self.begins_at]    
    if(recurs)
      while((dates.last <=> self.recurrence_ends_at) <= 0)
        dates << next_occurrence(dates.last)
      end
    end
    dates
  end
  
  def next_occurrence(date)
    if(recurrence_type == "weekly")
      1.week.since(date)
    else
      2.week.since(date)
    end
  end

  
end

