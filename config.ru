require "bundler"
Bundler.require
require './config/config'
Dir.glob('./{controllers, helpers, models}/*.rb').each {|file| require file}


#routes#########################################
map('/weixin_api') { run WeixinApiController }
map('/') {run ApplicationController}