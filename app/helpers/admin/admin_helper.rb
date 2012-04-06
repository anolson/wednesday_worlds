module Admin::AdminHelper
  def edit_link(title, path)
    content_for :edit_link do
      link_to title, path
    end
  end
end
