require 'rubygems'
require 'bundler'
Bundler.require
require './config/config'
Dir.glob('./{helpers,models,controllers}/*.rb').each { |file| require file }
# 
# env = ENV['RACK_ENV'] || :development
# Mongoid.load!('./config/mongoid.yml', env)
# configure :production do
#  require 'newrelic_rpm'
#  enable :logging
#  GC::Profiler.enable
# end

# routes########################################
map('/weixin_api') { run WeixinApiController }
map('/') { run ApplicationController }
