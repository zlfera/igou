#coding:utf-8
require 'rubygems'
require 'bundler'
Bundler.require
set :public_folder, File.dirname(__FILE__) + '/public'
require './config/config'
Dir.glob('./{helpers,models,controllers}/*.rb').each {|file| require file}

#routes#########################################
map('/weixin_api') { run WeixinApiController }
map('/') {run ApplicationController}
