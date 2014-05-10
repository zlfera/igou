env = ENV['RACK_ENV'] || :development
Mongoid.load!('./config/mongoid.yml', env)
configure :production do
  require 'newrelic_rpm'
  enable :logging
  set :static, false
  GC::Profiler.enable

end
