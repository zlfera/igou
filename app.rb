#coding:utf-8
module App
  
  class Gougou < Sinatra::Base
    
    
    configure :production do
      require 'newrelic_rpm'
      enable :logging
      set :server, :puma
      set :force_ssl, true
      set :slim, layout_options: { views: 'views/layouts' }
      GC::Profiler.enable
    end
     
    env = ENV['RACK_ENV'] || :development
    Mongoid.load!("./config/mongoid.yml", env)
    
    Dir.glob('./{controllers,models,helpers}/*.rb').each {|file| require file}
    TOKEN = 'igougougou'
    
    before do
      require 'digest/sha1'
      timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
      codes = [TOKEN, timestamp, nonce].sort.join()
      status 200 unless Digest::SHA1.hexdigest(codes) == params[:signature]
    end
    

    
  end
    
end
