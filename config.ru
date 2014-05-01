require "bundler"
Bundler.require
Dir.glob('./{controllers, helpers, models}/*.rb').each {|file| require file}
#require './app'
#run App::Gougou
env = ENV['RACK_ENV'] || :development
configure :production do
  require 'newrelic_rpm'
  Mongoid.load!('./config/mongoid.yml', env)
  enable :logging
  GC::Profiler.enable
end

map('/weixin_api') { run WeixinApiController }
map('/') {run WeixinApiController}