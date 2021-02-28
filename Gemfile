source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'

gem 'active_decorator'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'carrierwave'
gem 'cocoon'
gem 'dotenv-rails'
gem "devise", git: "https://github.com/heartcombo/devise"
gem 'fog-aws'
gem 'jbuilder', '~> 2.7'
gem 'kaminari'
gem 'mysql2', '>= 0.4.4'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'sassc', '~> 2.1.0'
gem 'slack-notifier'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'whenever', require: false


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capistrano', '~> 3.4.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-yarn'
  gem 'capistrano3-unicorn'
  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production, :staging do
  gem 'unicorn'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
