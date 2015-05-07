source ENV['GEM_SOURCE'] || "https://rubygems.org"

group :test do
  gem 'rake',                    :require => false
  gem 'rspec-puppet',            :require => false
  gem 'puppetlabs_spec_helper',  :require => false
  gem 'puppet-lint',             :require => false
  gem 'simplecov',               :require => false
end
group :test, :acceptance do
  gem 'beaker',                  :require => false
  gem 'beaker-rspec',            :require => false
  gem 'serverspec',              :require => false
  gem 'pry',                     :require => false
  gem 'nokogiri', '1.5.11',        :require => false
  gem 'mime-types', '2.2',         :require => false
  gem 'i18n', '0.6.11',            :require => false
end
group :test, :development do
  gem 'guard',                   :require => false
  gem 'guard-rake',              :require => false
end


if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby

