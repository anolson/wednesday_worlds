class Occurrence < ActiveRecord::Base
  belongs_to :route
  
  def self.this_week
    today = Date.today
    (today.beginning_of_week..today.end_of_week)
  end
  
  def self.next_week
    one_week_from_today = 1.week.since(Date.today)
    (one_week_from_today.beginning_of_week..one_week_from_today.end_of_week)
  end
  
  def dates
    @dates ||= build_dates
  end
  
  def next_date
    date = this_weeks_date
    date ||= next_later_date
  end
  
  def this_weeks_date
    find_next_date { |date| return date if date_occurs_during_this_week?(date) }
  end

  def next_later_date
    find_next_date { |date| return date if date_occurs_later?(date) } 
  end
  
  def occurs_this_week?
    occurs? { |date| return true if date_occurs_during_this_week?(date)  }
  end

  def occurs_next_week?
    occurs? { |date| return true if date_occurs_during_next_week?(date)  }
  end

  def occurs_later?
    occurs? { |date| return true if date_occurs_later?(date) }
  end
    
  private 
    def build_dates
      dates = [self.begins_at]    
      if(recurs)
        while((dates.last <=> self.recurrence_ends_at) < 0)
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
    
    def find_next_date(&block)
      dates.each do |date|
        yield date
      end
      nil
    end
    
    def occurs?(&block)
      dates.each do |date|
        yield date
      end
      return false
    end
    
    def date_occurs_during_this_week?(date)
      return date_occurs_during_week?(date, Occurrence.this_week)
    end

    def date_occurs_during_next_week?(date)
      return date_occurs_during_week?(date, Occurrence.next_week)
    end

    def date_occurs_later?(date)
      return date > Date.today
    end

    def date_occurs_during_week?(date, week)
      return ((date > week.begin) and (date < week.end))
    end
    
end

