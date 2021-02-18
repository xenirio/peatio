# encoding: UTF-8
# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_slug| "https://github.com/#{repo_slug}" }

ruby '~> 3.0'

gem 'ransack', '~> 2.4.2'
gem 'rails', '~> 5.2.4'
gem 'puma', '~> 5.2.1'
gem 'mysql2', '~> 0.5.2'
gem 'redis', '~> 4.2.5', require: ['redis', 'redis/connection/hiredis']
gem 'hiredis', '~> 0.6.3'
gem 'figaro', '~> 1.2.0'
gem 'hashie', '~> 4.1.0'
gem 'aasm', '~> 5.1.1'
gem 'bunny', '~> 2.17.0'
gem 'cancancan', '~> 3.2.1'
gem 'enumerize', '~> 2.4.0'
gem 'kaminari', '~> 1.2.1'
gem 'rbtree', '~> 0.4.4'
gem 'grape', '~> 1.5.2'
gem 'grape-entity', '~> 0.8.2'
gem 'grape-swagger', '~> 1.3.1'
gem 'grape-swagger-ui', '~> 2.2.8'
gem 'grape-swagger-entity', '~> 0.5.1'
gem 'grape_logging', '~> 1.8.4'
gem 'rack-attack', '~> 6.5.0'
gem 'faraday', '~> 1.3.0'
gem 'better-faraday', '~> 1.1.4'
# gem 'faraday_middleware', '~> 0.13.1'
# gem 'faye', '~> 1.4.0'
# gem 'eventmachine', '~> 1.2.7'
# gem 'em-synchrony', '~> 1.0.6'
gem 'jwt', '~> 2.2.2'
gem 'email_validator', '~> 2.2.2'
gem 'validate_url', '~> 1.0.13'
gem 'god', '~> 0.13.7', require: false
gem 'arel-is-blank', '~> 1.0.0'
gem 'sentry-raven', '~> 3.1.1', require: false
gem 'memoist', '~> 0.16.2'
gem 'method-not-implemented', '~> 1.0.1'
gem 'validates_lengths_from_database', '~> 0.8.0'
gem 'jwt-multisig', '~> 1.0.5'
gem 'cash-addr', '~> 0.3.0', require: 'cash_addr'
gem 'sha3', '~> 1.0.2'
gem 'scout_apm', '~> 4.0.4', require: false
# gem 'peatio', '~> 2.6.2' #TODO Update peatio
# gem 'irix', '~> 2.6.0'   TODO Update irix (move to peatio)
gem 'rack-cors', '~> 1.1.1', require: false
gem 'jwt-rack', '~> 0.1.1', require: false
gem 'env-tweaks', '~> 1.0.1'
gem 'vault', '~> 0.15.0', require: false
gem 'vault-rails', git: 'http://github.com/rubykube/vault-rails'
gem 'bootsnap', '~> 1.7.2', require: false
gem 'net-http-persistent', '~> 4.0.1'
gem 'influxdb', '~> 0.8.1'
gem 'safe_yaml', '~> 1.0.5', require: 'safe_yaml/load'

group :development, :test do
  gem 'irb'
  gem 'bump',                  '~> 0.10'
  gem 'faker',                 '~> 2.16'
  gem 'pry-byebug',            '~> 3.9'
  gem 'bullet',                '~> 6.1.3'
  gem 'grape_on_rails_routes', '~> 0.3.2'
end

group :development do
  gem 'annotate',   '~> 3.1.1'
  gem 'ruby-prof',  '~> 0.17.0', require: false
  gem 'listen',     '~> 3.4.1'
end

group :test do
  gem 'rspec-rails',         '~> 3.8', '>= 3.8.2'
  gem 'rspec-retry',         '~> 0.6.2'
  gem 'webmock',             '~> 3.11.2'
  gem 'database_cleaner',    '~> 2.0.1'
  gem 'mocha',               '~> 1.12', require: false
  gem 'factory_bot_rails',   '~> 6.1.0'
  gem 'timecop',             '~> 0.9'
  gem 'rubocop-rspec',       '~> 2.2', require: false
end

# Load gems from Gemfile.plugin.
Dir.glob File.expand_path('../Gemfile.plugin', __FILE__) do |file|
  eval_gemfile file
end

gem "pg", "~> 1.2.3"
