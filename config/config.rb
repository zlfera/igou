libdir = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
env = ENV['RACK_ENV'] || :development
Mongoid.load!('./config/mongoid.yml', env)
configure :production do
  require 'newrelic_rpm'
  enable :logging
  GC::Profiler.enable
end
