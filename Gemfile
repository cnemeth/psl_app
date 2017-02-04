source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes

# The release version, 0.12.3, is not ready for Ruby 2.4 so need to pull this from Github
# gem 'therubyracer', platforms: :ruby
gem 'therubyracer', git: 'https://github.com/cowboyd/therubyracer.git'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Slim is a template language whose goal is reduce the syntax to the essential parts without becoming cryptic.
gem 'slim-rails'

# This library provides integration of RubyMoney - Money gem with Rails
gem 'money-rails', '~> 1.8'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'pry-byebug'
  gem 'factory_girl_rails'
end

group :test, :ci do
  gem 'guard-livereload'
  gem 'guard'
  gem 'guard-bundler'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'fuubar'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'webmock'
  gem 'poltergeist'
  gem 'vcr'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'validates_timeliness'
  gem 'simplecov', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Misc. Utilities
gem "RedCloth" # for parsing textile
gem "bluecloth" # for parsing markdown
gem 'faker'
gem 'awesome_print'
gem 'annotate'
