source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.6"
gem "puma", "~> 3.7"
gem "faker"
gem "active_model_serializers", "~> 0.10.0"
gem "bcrypt", "~> 3.1.7"
gem "jwt"
gem "rack-cors"
gem "rack-attack"
gem "figaro"
gem "config"
gem "will_paginate", "~> 3.1.0"

group :development, :test do
  gem "sqlite3", "1.3.13"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :production do
  gem "pg", "0.20.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
