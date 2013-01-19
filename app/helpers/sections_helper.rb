module SectionsHelper
  def section(title, header_link, partial)
    render 'admin/common/section', section_options(title, header_link, partial)
  end

  def section_options(title, header_link, partial)
    { title: title, header_link: header_link, partial: partial }
  end
end