libdir = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)
# env = ENV['RACK_ENV'] || :development
Mongoid.load!('./config/mongoid.yml', ENV['RACK_ENV'])
configure :production do
  require 'newrelic_rpm'
  enable :logging
  GC::Profiler.enable
end

%w(helpers models controllers).each do |dir|
  Dir.glob(File.expand_path("../#{dir}", __FILE__) + '/**/*.rb').each do |file|
    require file
  end
end