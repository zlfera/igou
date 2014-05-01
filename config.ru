require "bundler"
Bundler.require
require './config/config'
Dir.glob('./{models,helpers,controllers}/*.rb').each {|file| require file}

#ApplicationController.configure :production do
  #Mongoid.setup(:default, ENV['DATABASE_URL'])
#end

#routes#########################################
map('/weixin_api') { run WeixinApiController }
map('/') {run ApplicationController}