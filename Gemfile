source 'https://rubygems.org'
ruby '2.5.8'

gem 'rails', '5.2.4.3'

gem 'bcrypt'
gem 'oauth', '~> 0.4.7'
gem 'redcarpet'
gem 'sass-rails'
gem 'puma'
gem 'twitter'
gem 'uglifier'
gem 'bootsnap', require: false

group :development do
  gem 'spring', '~> 2.0.2'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
  gem 'listen'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry'
  gem 'rspec-rails', '~> 3.5'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
