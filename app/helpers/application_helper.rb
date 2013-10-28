module ApplicationHelper
  def main_classes
    "main page-content col-sm-#{ content_for?(:sidebar) ? "8" : "12"}" +
      if signed_in? && current_page?(current_user)
        ' account-info'
      else
        ''
      end
  end

  def sidebar_classes
    "sidebar col-sm-4" +
      if signed_in? && current_page?(current_user)
        ' user-sidebar'
      else
        ''
      end
  end

end
