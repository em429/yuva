module ApplicationHelper
  def link_to_with_hl(link_title, path, classes="font-bold")
    link_to link_title, path, class: (classes if current_page?(path))
  end
end
