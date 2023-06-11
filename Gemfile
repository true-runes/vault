source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'activerecord-import'
gem 'bootsnap', require: false
gem 'dotenv-rails'
gem 'google-apis-sheets_v4'
gem 'jbuilder'
gem 'pg'
gem 'puma'
gem 'rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop-rails', require: false
end

group :development do
  gem 'rails-erd'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', require: false
end
