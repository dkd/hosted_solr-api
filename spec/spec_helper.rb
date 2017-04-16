$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start
# Coveralls.wear!

require 'hosted_solr/api'
require 'shoulda/matchers'

RSpec::Expectations.configuration.warn_about_potential_false_positives = false
