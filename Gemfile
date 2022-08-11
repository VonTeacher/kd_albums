source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "factory_bot_rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
  gem "rspec-rails"
end

group :development do
end
