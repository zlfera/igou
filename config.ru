require "bundler"
Bundler.require
Dir.glob('./{controllers, helpers, models}/*.rb').each {|file| require file}
require './config/config'

#routes#########################################
map('/weixin_api') { run WeixinApiController }
map('/') {run ApplicationController}