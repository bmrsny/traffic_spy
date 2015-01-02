ENV["TRAFFIC_SPY_ENV"] ||= "test"
require 'bundler'
Bundler.require
require 'minitest/autorun'
require 'minitest/pride'
require 'sinatra'
$:.unshift File.expand_path("../../lib", __FILE__)
