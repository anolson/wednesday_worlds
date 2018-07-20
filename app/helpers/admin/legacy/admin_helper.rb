module Admin::Legacy::AdminHelper
  def edit_link(title, path)
    content_for :edit_link do
      link_to title, path
    end
  end

  def login_box
    content_for :login_box, "login"
  end

  def login_box_class
    content_for :login_box if content_for? :login_box
  end
end
