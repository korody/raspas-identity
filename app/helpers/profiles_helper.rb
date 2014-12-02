module ProfilesHelper
  def avatar_for(profile, options = {})
    default = { size: 500, default: 'identicon', forcedefault: 0, rating: 'g', 
      class: 'img-responsive' }
    options = default.merge(options)
    if profile.image.present?
      options[:size] = "#{options[:size]}x#{options[:size]}"
      image_tag profile.image, options
    elsif profile.authentications.any?
      image_tag profile.authentications.first.image, options
    else
      gravatar_id  = Digest::MD5::hexdigest(profile.email.downcase)
      gravatar_url = "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{options[:size]}&d=#{options[:default]}&r=#{options[:rating]}"
      image_tag(gravatar_url, width: options[:size], height: options[:size], alt: profile.name, class: "gravatar #{options[:class]}")
    end
  end
end
