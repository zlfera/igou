#coding:utf-8
module App
  require 'digest/sha1'
  class Gougou < Sinatra::Base
    enable :logging
    Dir.glob('./controllers/*.rb').each {|file| require file}
    TOKEN = 'igougougou'
    before do
      timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
      codes = [TOKEN, timestamp, nonce].sort.join('')
      halt(401,'wrong') unless Digest::SHA1.hexdigest(codes) == params[:signature]
    end
    

    
  end
end
