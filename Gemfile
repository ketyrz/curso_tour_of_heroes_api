source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.6"
gem "puma", "~> 5.0"
gem "bootsnap", require: false
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "active_model_serializers", "~> 0.10.13"
gem "rack-cors", "~> 2.0"
gem "rubocop", require: false
gem "spring-commands-rspec", "~> 1.0"
 
group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw] 
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

group :development do
  gem 'faker', '~> 3.2'
  gem "spring"
end

group :test do
  gem 'shoulda-matchers', '~> 5.3'
  gem 'simplecov', '~> 0.22.0'
end 

group :production do
  gem 'pg', '~> 1.5', '>= 1.5.3'
end