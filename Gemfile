source 'https://rubygems.org'
ruby '2.2.3'

gem 'rails', '4.2.7.1'

gem "uglifier"
gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
gem 'jquery-rails'
gem 'oauth', '~> 0.4.7'
gem 'redcarpet'
gem 'sass-rails'
gem 'thin'
gem 'twitter'

group :development do
  gem 'sqlite3'
  gem 'heroku'
  gem 'spring'
  gem 'spring-commands-rspec'
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
