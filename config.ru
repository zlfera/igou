#coding:utf-8
require 'rubygems'
require 'bundler'
Bundler.require
require './config/config'
Dir.glob('./{helpers,models,controllers}/*.rb').each {|file| require file}

#routes#########################################
map('/weixin_api') { run WeixinAppliController }
map('/') {run ApplicationController}
