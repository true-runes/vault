source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.4.3'

gem 'activerecord-import'
gem 'bootsnap', require: false
gem 'csv'
gem 'dotenv-rails'
gem 'google-api-client'
gem 'google-apis-sheets_v4'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails'
gem 'sentry-rails'
gem 'sentry-ruby'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', require: false
end
