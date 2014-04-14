#coding:utf-8
module App
  
  class Gougou < Sinatra::Base
    enable :logging
    Dir.glob('./controllers/*.rb').each {|file| require file}
    TOKEN = 'igougougou'
    before do
      require 'digest/sha1'
      timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
      codes = [TOKEN, timestamp, nonce].sort.join('')
      if Digest::SHA1.hexdigest(codes) == params[:signature]
        render 'h'
      else
        render 'g'
      end
    end
    

    
  end
    
end
