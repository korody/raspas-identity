OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, on_failed_registration: lambda { |env|
    ProfilesController.action(:new).call(env)
  }, model: Profile, fields: [:email]
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], 
    image_size: { height: 500, width: 500 }, display: 'popup'
  provider :twitter, "TWITTER_API_KEY", "TWITTER_API_SECRET",
    image_size: 500
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"],
    name: 'google', image_size: 500
end