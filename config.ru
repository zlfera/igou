require "bundler"
Bundler.require
Dir.glob('./{controllers, helpers, models}/*.rb').each {|file| require file}
#require './app'
#run App::Gougou
map('/weixin_api') { run WeixinApiController }