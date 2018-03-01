require 'simplecov'
SimpleCov.start
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative '../lib/probe'
require_relative '../lib/plateau'
require 'minitest/autorun'
