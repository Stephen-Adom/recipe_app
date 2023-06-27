module ApplicationHelper
  def set_nav_active(page)
    return 'active' if current_page?(page)
  end
end
