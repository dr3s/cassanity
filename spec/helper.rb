$:.unshift(File.expand_path('../../lib', __FILE__))

require 'rubygems'
require 'bundler'

Bundler.require :default

require 'cassanity'

root = Pathname(__FILE__).dirname.join('..').expand_path

Dir[root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.order = :random

  config.filter_run :focused => true
  config.alias_example_to :fit, :focused => true
  config.alias_example_to :xit, :pending => true
  config.run_all_when_everything_filtered = true

  config.backtrace_clean_patterns = [
    /lib\/rspec\/(core|expectations|matchers|mocks)/,
  ]

  config.include CassanityHelpers
end