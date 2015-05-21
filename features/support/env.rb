# Generated by cucumber-sinatra. (2015-05-19 17:19:36 +0100)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'rps.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'cucumber/rspec/doubles'
require 'byebug'

Capybara.app = RPS

class RPSWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
end

World do
  RPSWorld.new
end