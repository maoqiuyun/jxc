module ApplicationHelper
  #控制当前选中MENU
  def active_top_menu name
    if name.is_a?(Array)
      "active" if name.include?(controller_name)
    else
      "active" if controller_name == name
    end
  end
  
  def now_location(index_title,subset_title)
  end
  
end
