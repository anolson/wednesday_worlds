source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '3.2.22.5'

gem 'jquery-rails'
gem 'oauth', '~> 0.4.7'
gem 'redcarpet'
gem 'strong_parameters'
gem 'test-unit', '~> 3.0'
gem 'twitter'
gem 'thin'

group :assets do
  gem 'sass-rails', " ~> 3.2.6"
  gem 'coffee-rails', " ~> 3.2.2"
  gem "uglifier", "~> 1.2.4"
end

group :development do
  gem 'sqlite3'
  gem 'heroku'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
