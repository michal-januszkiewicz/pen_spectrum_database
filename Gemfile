source "https://rubygems.org"

ruby "2.4.1"

gem "activesupport"
gem "hanami", "~> 1.1"
gem "hanami-model", "~> 1.1"
gem "rake"

gem "pg"

gem "slim"

gem "omniauth"
gem "omniauth-auth0"

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem "shotgun"
end

group :test, :development do
  gem "dotenv", "~> 2.0"
  gem "pry"
  gem "rubocop"
  gem "get_process_mem"
end

group :test do
  gem "capybara"
  gem "rspec"
end

group :production do
  gem "puma"
end
