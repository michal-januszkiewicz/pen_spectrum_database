source "https://rubygems.org"

gem "hanami", "~> 1.1"
gem "hanami-model", "~> 1.1"
gem "rake"

gem "pg"

gem "slim"

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem "shotgun"
end

group :test, :development do
  gem "dotenv", "~> 2.0"
  gem "pry"
  gem "rubocop"
end

group :test do
  gem "capybara"
  gem "rspec"
end

group :production do
  # gem 'puma'
end
