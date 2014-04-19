#coding:utf-8
module App
  
  class Gougou < Sinatra::Base
    
    helpers do
      def check_token
        require 'digest/sha1'
        timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
        codes = [TOKEN, timestamp, nonce].sort.join()
        if Digest::SHA1.hexdigest(codes) == params[:signature]
          'true'
        else
          'false'
        end
          
      end
    end

    configure do
    enable :logging
    set :server, :puma
    set :force_ssl, true
    set :slim, layout_options: { views: 'views/layouts' }
    
    end
    Dir.glob('./controllers/*.rb').each {|file| require file}
    TOKEN = 'igougougou'
    #before do
      #require 'digest/sha1'
      #timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
      #codes = [TOKEN, timestamp, nonce].sort.join()
      #status 200 unless Digest::SHA1.hexdigest(codes) == params[:signature]
    #end
    

    
  end
    
end
