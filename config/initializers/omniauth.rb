OmniAuth.config.logger = Rails.logger
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, on_failed_registration: lambda { |env|
    ProfilesController.action(:new).call(env)
  }, model: Profile, fields: [:email]
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
end