module Admin::SectionsHelper
  def section(title, partial, header_link = nil)
    render 'admin/common/section', section_options(title, partial, header_link)
  end

  def section_options(title, partial, header_link)
    { title: title, partial: partial, header_link: header_link }
  end
end