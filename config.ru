require 'rubygems'
require 'bundler'
Bundler.require
require './config/config'
libdir=File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
# routes########################################
map('/weixin_api') { run WeixinApiController }
map('/') { run ApplicationController }
map('/index') { run IndexController}