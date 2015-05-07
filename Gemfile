source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'foundation-rails'
gem 'sass-rails', '~> 5.0.3'			# Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'			# Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.1.0'	# Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'							# Use jquery as the JavaScript library
gem 'turbolinks'								# Turbolinks makes following links in your web application faster.
gem 'jbuilder', '~> 2.0'				# Build JSON APIs with ease.
gem 'sdoc', '~> 0.4.0', group: :doc	# bundle exec rake doc:rails generates the API under doc/api.
gem 'will_paginate', '3.0.7'
gem 'will_paginate-foundation'

gem 'bcrypt', '~> 3.1.7'			  # Use ActiveModel has_secure_password
# gem 'capistrano-rails', group: :development # Use Capistrano for deployment

group :development, :test do
	gem 'sqlite3'
  gem 'byebug'									# Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'web-console', '~> 2.0'		# Access an IRB console on exception pages or by using <%= console %> in views
  gem 'spring'									# Spring speeds up development by keeping your application running in the background.
  gem 'rails_layout'
  gem 'faker', '1.4.2'          # Make sample users with semi-realistic names and email addresses
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  #gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
  gem 'unicorn',        '4.8.3' # Use Unicorn as the app server
end
