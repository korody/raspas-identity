module ApplicationHelper
  def full_title(page_title = nil)
    base_title = "raspas"
    page_title.blank? ? base_title : "#{base_title} | #{page_title}"
  end
  
  def page_description(desc)
    desc
  end
  
  def body_tag
    content_tag :body, class: "#{controller_name} #{action_name}" do
      yield
    end
  end
  
  def icon_tag(icon, options = {})
    options[:class] = (%w[fa] | icon.split).join(" fa-")
    content_tag :i, nil, options
  end
end