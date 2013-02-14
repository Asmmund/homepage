source 'https://rubygems.org'

  gem 'rails', '3.2.11'

# Bundle edge Rails instead:
  # gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'activerecord-deprecated_finders', git: 'git://github.com/rails/activerecord-deprecated_finders.git'
gem 'pg'

gem "unicorn"
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
gem "thin", "1.5.0"
gem "eventmachine", "1.0.0.rc.1"
gem 'slim'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'passenger'

gem 'will_paginate', '~> 3.0'
gem 'bcrypt-ruby', '~> 3.0.0'
gem "ransack"
gem 'rails3-jquery-autocomplete'
gem 'nifty-generators'
gem 'jquery-rails', '~> 2.0'
gem 'tinymce-rails'
group :development do
  gem 'debugger'
end
group :test, :development do
  gem "rspec-rails", "~> 2.0"
end
group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem "guard-rspec"
end

