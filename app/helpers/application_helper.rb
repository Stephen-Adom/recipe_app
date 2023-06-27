module ApplicationHelper
  def nav_active(page)
    return 'active' if current_page?(page) || request.original_fullpath.start_with?("#{page}/")
  end
end
