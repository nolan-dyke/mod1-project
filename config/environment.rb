require 'bundler/setup'
Bundler.require
require 'pry'
require 'colorize'
require 'colorized_string'
ActiveRecord::Base.logger = nil

require_all 'lib'



#