# ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
# require 'bundler/setup' if File.exist?(ENV['BUNDLE_GEMFILE'])
# require 'bundler'
# Bundler.require
# require './config/config'
require File.expand_path("../boot", __FILE__)
# Dir.glob('./{helpers,models,controllers}/*.rb').each { |file| require file }
# %w(helpers models controllers).each do |dir|
#  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
#     require file
#   end
# end
# routes########################################
map('/') { run ApplicationController }
map('/weixin_api') { run WeixinApiController }
map('/index') { run IndexController }

