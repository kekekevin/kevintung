source 'https://rubygems.org'

ruby "1.9.3"

gem 'rails', '4.0.0'

group :development do
  gem 'rb-fsevent'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'factory_girl_rails'
  gem 'jasminerice', git: 'https://github.com/bradphelan/jasminerice.git'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'handlebars_assets'
gem 'uglifier', '>= 1.0.3'

gem 'jquery-rails'
gem 'haml-rails'
gem 'simple_form', '~> 3.0.0.rc'
gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'newrelic_rpm'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger

gem 'debugger', group: [:development, :test]
