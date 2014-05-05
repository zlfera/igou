#coding:utf-8
require 'rubygems'
require 'bundler'
Bundler.require
mset :public_folder, File.expand_path('../../public', __FILE__)
require './config/config'
Dir.glob('./{helpers,models,controllers}/*.rb').each {|file| require file}

#routes#########################################
map('/weixin_api') { run WeixinApiController }
map('/') {run ApplicationController}
