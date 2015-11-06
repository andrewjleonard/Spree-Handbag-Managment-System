# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_hms'
  s.version     = '3.0.1'
  s.summary     = 'Adds a Handbag Management System.'
  s.description = 'ALlows for customers to submit a bag through a portal and provides an administrative panel to overview.'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Andrew'
  s.email     = 'professional@aleonard.co.uk'
  s.homepage  = 'http://aleonard.co.uk'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.1'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'carrierwave', '~> 0.10.0'
  s.add_development_dependency 'mini_magick', '~> 3.8.0'
end
