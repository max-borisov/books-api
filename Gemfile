source 'https://rubygems.org'

ruby '2.3.1'
gem 'rails', '4.2.7'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# gem 'jquery-ui-rails'
gem 'haml-rails'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'jquery-rails'
gem 'paperclip', '~> 5.0.0'
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'faker'
gem 'pg'
gem 'awesome_print'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'puma', group: :production
gem 'pry', group: [:development, :test]
gem 'byebug', group: [:development, :test]

group :development do
  gem 'rubocop', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'brakeman', :require => false
end

group :development, :test do
  gem 'shoulda-matchers', '~> 3.0'
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'database_cleaner', '~> 1.5', '>= 1.5.1'
  gem 'spring', '1.6.3'
  gem 'spring-commands-rspec'
end
