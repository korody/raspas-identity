source 'https://rubygems.org'

gem 'rails', '4.2.0.beta4'
gem 'pg'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'bootstrap-sass'
gem 'slim-rails'
gem 'font-awesome-rails'

# gem 'omniauth'
gem 'omniauth-identity'
gem 'omniauth-facebook'
# gem 'omniauth-twitter'
# gem 'omniauth-google'

gem 'figaro'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails', '~> 4.0.0.beta2'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'better_errors'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0.0.beta4'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  # gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end