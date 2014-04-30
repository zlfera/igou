#coding:utf-8
module App
  
  class Gougou < Sinatra::Base
    
    env = ENV['RACK_ENV'] || :development
    configure :production do
      require 'newrelic_rpm'
      Mongoid.load!('./config/mongoid.yml', env)
      enable :logging
      set :server, :puma
      set :force_ssl, true
      set :slim, layout_options: { views: 'views/layouts' }
      GC::Profiler.enable
    end
     

    
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
