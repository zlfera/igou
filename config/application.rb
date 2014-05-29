%w(helpers models controllers).each do |dir|
  Dir.glob(File.expand_path("../../#{dir}", __FILE__) << '/*').each do |file|
    require file
  end
end

libdir = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

Mongoid.load!('./config/mongoid.yml', ENV['RACK_ENV'])

configure :production do
  require 'newrelic_rpm'
  enable :logging
  GC::Profiler.enable
end

class ApplicationController
  configure do |c|
    c.set :root, File.expand_path('../../', __FILE__)
    c.set :public_folder, File.expand_path('../../public', __FILE__)
    c.set :views, File.expand_path('../../views', __FILE__)
    c.set :slim, layout_options: { views: 'views/layouts' }
#   c.enable :logging, :static, :sessions
  end
end