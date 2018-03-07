module ApplicationHelper
  def format_time(date)
    date.strftime("%l:%M%p").downcase.strip
  end

  def format_time_short(date)
    date.strftime("%l%p").downcase.strip
  end

  def format_date(date)
    date.strftime("%b %-e")
  end

  def page_title(title)
    content_for :page_title, title
  end

  def page_wrapper(&block)
    content_tag :div, :class => page_wrapper_classes, &block
  end

  def page_wrapper_classes
    ['wrapper'] + Array(login_box_class)
  end

  def render_markdown(text)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text).html_safe
  end
end
