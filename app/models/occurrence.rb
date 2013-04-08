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
    this_week || next_week || later
  end

  def this_week
    detect_date { |date| occurs_this_week?(date) }
  end

  def next_week
    detect_date { |date| occurs_next_week?(date) }
  end

  def later
    detect_date { |date| occurs_later?(date) }
  end

  def this_week?
    this_week && true || false
  end

  def next_week?
    next_week && true || false
  end

  def later?
    later && true || false
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

  def detect_date(&block)
    dates.detect do |date|
      yield date
    end
  end

  def occurs_this_week?(date)
    occurs_during_week?(date, Occurrence.this_week)
  end

  def occurs_next_week?(date)
    occurs_during_week?(date, Occurrence.next_week)
  end

  def occurs_later?(date)
    date > Date.today
  end

  def occurs_during_week?(date, week)
    ((date >= week.begin) && (date <= week.end))
  end
end

