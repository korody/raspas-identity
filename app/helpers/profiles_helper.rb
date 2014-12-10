module ProfilesHelper
  def avatar_for(profile, options = {})
    default = { size: 500, default: 'identicon', forcedefault: 0, rating: 'g', 
      class: 'img-responsive' }
    options = default.merge(options)
    auth_with_image = profile.authentications.where.not(image: nil)
    if profile.image.present?
      options[:size] = "#{options[:size]}x#{options[:size]}"
      image_tag profile.image, options
    elsif auth_with_image.any?
      image_tag auth_with_image.first.image, options
    else
      gravatar_id  = Digest::MD5::hexdigest(profile.email.downcase)
      gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:size]}&d=#{options[:default]}&r=#{options[:rating]}"
      image_tag(gravatar_url, width: options[:size], height: options[:size], alt: profile.name, class: "gravatar #{options[:class]}")
    end
  end
  
  def auth_item_media(profile, provider_name, path, options = {})
    connected_provider = is_provider_connected_to(profile, provider_name)
    content_tag :div, class: 'auth_item_media' do
      if connected_provider
        image_tag profile.authentications.find_by_provider(provider_name).image, 
          class: 'img-circle'
      else
        nav_button "#{provider_name} fw", provider_name, path
      end
    end
  end
  
  def link_to_connection(profile, provider_name, path, options = {})
    connected_provider = is_provider_connected_to(profile, provider_name)
    content_tag :div, class: 'auth_item_body' do
      if connected_provider
        authentication = profile.authentications.find_by_provider(provider_name)
        if profile.authentications.size == 1
          link_to "desvincular e apagar conta", 
            profile_path(profile.id), method: :delete, data: { confirm: "Você está presetes a apagar o seu perfil e sua conexão com este pensador. Você tem certeza?" }
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
  
  def is_provider_connected_to(profile, provider_name)
    profile_auths = profile.authentications.map { |a| a.provider }
    profile_auths.include?(provider_name)
  end
end
