source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'bcrypt', '~> 3.1.7'
gem 'image_processing', '~> 1.2'
gem 'active_storage_validations', '~> 0.8.8'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'kaminari', '~> 1.2.2'
gem 'bootstrap5-kaminari-views', '~> 0.0.1'
gem 'font-awesome-rails'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'searchkick', '~> 4.3.0'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'devise'
gem 'cancancan'
gem 'rails_admin'
gem 'dotenv-rails'
gem 'omniauth-google-oauth2'
gem "omniauth-rails_csrf_protection"

group :development, :test do
  gem 'sqlite3', '~> 1.4'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
