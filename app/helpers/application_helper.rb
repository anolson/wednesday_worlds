module ApplicationHelper
  def format_time(date)
    date.strftime("%l:%M%p").downcase.strip
  end
  
  def format_time_short(date)
    date.strftime("%l%p").downcase.strip
  end
  
  def format_date(date)
    date.strftime("%b %e")
  end
end
