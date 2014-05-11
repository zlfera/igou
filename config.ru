require 'rubygems'
require 'bundler'
Bundler.require
require './config/config'
Dir.glob('./{helpers,models,controllers}/*.rb').each { |file| require file }

# routes########################################
map('/weixin_api') { run Zlf::WeixinApiController }
map('/') { run Zlf::ApplicationController }
