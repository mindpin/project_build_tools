require "bundler"
Bundler.setup(:default)
require "sinatra"
require "sinatra/reloader"
require 'sinatra/assetpack'
require "pry"
require 'haml'
require 'sass'
require 'coffee_script'
require 'yui/compressor'
require 'sinatra/json'
require 'mongoid'
Mongoid.load!("./config/mongoid.yml")

#require File.expand_path("../../lib/models/xxx",__FILE__)
#require File.expand_path("../../lib/helpers/xxx",__FILE__)