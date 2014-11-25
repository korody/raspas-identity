module NavigationHelper
  def currently_at(section)
    render partial: 'raspas_nav', locals: { section: section }
  end
  
  def nav_link(icon, title, path, options = {})
    current_section = options.delete(:current_section)
    options[:class] = (current_section == title) ? 'active' : nil
    content_tag :li, options do
      link_to icon_tag(icon), path, class: 'nav-link', 
                                    data: { toggle: 'tooltip', 
                                    placement: 'right',
                                    'original-title' => title }
    end
  end
  
  def nav_button(icon, title, path, options = {})
    default_class = 'btn btn-default btn-lg navbar-btn btn-round'
    active_class = default_class + ' active'
    current_section = options.delete(:current_section)
    options[:class] = (current_section == title) ? active_class : default_class
    content_tag :button, options do
      link_to icon_tag(icon), path, class: 'nav-link', 
                                    data: { toggle: 'tooltip', 
                                            placement: 'right', 
                                           'original-title' => title }
    end
  end
end