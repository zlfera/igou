require File.expand_path('../config/boot', __FILE__)
# routes########################################
# map('/') { run ApplicationController }
# map('/weixin_api') { run WeixinApiController }
# map('/index') { run IndexController }
#run ApplicationController
run WeixinApiController
#run IndexController