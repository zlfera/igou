require 'bundler'
Bundler.require
require './config/config'

# routes########################################
map('/weixin_api') { run WeixinApiController }
map('/') { run ApplicationController }
map('/index') { run IndexController }
