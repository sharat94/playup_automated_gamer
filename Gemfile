source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_model_serializers', '~> 0.10.7'
gem 'chromedriver-helper'
gem 'httparty'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.1.4'
gem 'selenium-webdriver'
gem 'watir', '~> 6.10', '>= 6.10.3'
gem 'spreadsheet'
gem 'sidekiq'
gem 'redis-rails'
gem 'axlsx'
gem 'zip-zip'
gem "sidekiq-cron", "~> 0.6.3"
gem 'rufus-scheduler', '~> 3.4.0'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
