source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.6"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "sqlite3", "~> 1.4"
gem "active_model_serializers", "~> 0.10.13"
gem "rack-cors", "~> 2.0"
 
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0"
end

group :development do
  gem "faker", "~> 3.2"
end

group :production do
  gem 'pg', '~> 0.18.4'
end

group :test do
  gem "shoulda-matchers", "~> 5.3"
  gem "simplecov", "~> 0.22.0", require: false
end
