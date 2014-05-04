#coding:utf-8
require 'rubygems'
require 'bundler'
Bundler.require
require './config/config'
Dir.glob('./{models, helpers, controllers}/*.rb').each {|file| require file}

#routes#########################################
map('/weixin_api') { run WeixinApiController }
map('/') {run ApplicationController}