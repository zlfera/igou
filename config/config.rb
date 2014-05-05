env = ENV['RACK_ENV'] || :development
Mongoid.load!('./config/mongoid.yml', env)
configure :production do
  set :public_folder, File.expand_path('../../public', __FILE__) 
  set :views, File.expand_path('../../views', __FILE__)
  set :slim, layout_options: { views: 'views/layouts' }
  require 'newrelic_rpm'
  enable :logging
  GC::Profiler.enable
end