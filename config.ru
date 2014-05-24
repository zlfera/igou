require 'bundler'
Bundler.require
require './config/config'
Dir.glob('./{helpers,models,controllers}/*.rb').each { |file| require file }

# routes########################################
map('/') { run ApplicationController }
map('/weixin_api') { run WeixinApiController }
map('/index') { run IndexController }
