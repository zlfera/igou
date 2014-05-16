Dir.glob('./{helpers,models,controllers}/*.rb').each { |file| require file }
env = ENV['RACK_ENV'] || :development
Mongoid.load!('./config/mongoid.yml', env)
configure :production do
  require 'newrelic_rpm'
  enable :logging
  GC::Profiler.enable
end
