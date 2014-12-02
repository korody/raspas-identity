module AuthorsHelper
  def auth_item_media(author, provider_name, path, options = {})
    connected_provider = is_provider_connected_to(author, provider_name)
    content_tag :div, class: 'auth_item_media' do
      if connected_provider
        image_tag author.authentications.find_by_provider(provider_name).image, 
          class: 'img-circle'
      else
        options[:class] = 'btn btn-default btn-lg navbar-btn btn-round'
        content_tag :button, options do
          link_to icon_tag("#{provider_name} fw"), path, 
                                                  data: { toggle: 'tooltip', 
                                                  placement: 'top', 
                                                  'original-title' => provider_name }
        end
      end
    end
  end
  
  def link_to_connection(author, provider_name, path, options = {})
    connected_provider = is_provider_connected_to(author, provider_name)
    content_tag :div, class: 'auth_item_body' do
      if connected_provider
        authentication = author.authentications.find_by_provider(provider_name)
        if author.authentications.size == 1
          link_to "desvincular e apagar conta", 
            profile_path(author.profile.id), method: :delete
        else
          link_to "desvincular", authentication_path(authentication.id), 
                                 method: :delete
        end
      else
        link_to "vincular", "/auth/#{provider_name}"
      end
    end
  end
    
private  
  
  def is_provider_connected_to(author, provider_name)
    author_auths = author.authentications.map { |a| a.provider }
    author_auths.include?(provider_name)
  end
end