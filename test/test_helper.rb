ENV["TRAFFIC_SPY_ENV"] ||= "test"



require 'sinatra'
require 'capybara'
require 'bundler'
Bundler.require

require 'rack/test'
require 'minitest/autorun'
require 'minitest/pride'
$:.unshift File.expand_path("../../lib", __FILE__)
