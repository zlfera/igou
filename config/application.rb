%w(helpers models controllers).each do |dir|
  Dir.glob(File.expand_path("../../#{dir}", __FILE__) + '/*').each do |file|
    load file
  end
end
Bundler.require(:default, ENV['RACK_ENV'])

libdir = File.expand_path('../../lib', __FILE__)
# a = File.expand_path('./controllers', __FILE__)
# $LOAD_PATH.unshift(a) unless $LOAD_PATH.include?(a)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
Mongoid.load!('./config/mongoid.yml', ENV['RACK_ENV'])

configure :production do
  require 'newrelic_rpm'
  enable :logging
  GC::Profiler.enable
end

class Sinatra::Base
  configure do |c|
    c.set :root, File.expand_path("../../", __FILE__)
    c.set :public_folder, File.expand_path("../../public", __FILE__)
    c.set :views, File.expand_path("../../views", __FILE__)
    c.set :slim, layout_options: { views: 'views/layouts' }
#   c.enable :logging, :static, :sessions
  end
end