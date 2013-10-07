ruby "2.0.0"
source 'http://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'haml-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
#gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise'
gem 'cancan'
gem 'geocoder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'guard-rspec'
end

group :test do
  gem 'capybara'
  gem 'rb-inotify'
  gem 'libnotify'
end

group :development do
  gem 'guard-livereload'
  gem 'meta_request', '0.2.5'
  #gem 'boson-more'
  gem 'irbtools', '~> 1.5.0', :require => false
  gem 'irbtools-more', :require => false
end

gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
gem 'capistrano', group: :development
gem 'rvm-capistrano'
#gem 'thin', group: :development
gem 'puma', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production

gem 'susy'
gem 'compass-rails', github: 'milgner/compass-rails', branch: 'rails4'
gem 'nokogiri'

gem 'whenever', :require => false

gem 'best_in_place', :git => "https://github.com/bernat/best_in_place", :branch => "rails-4"