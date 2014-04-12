#coding:utf-8
module App
  class Gougou < Sinatra::Base
    enable :logging
    Dir.glob('./controllers/*.rb').each {|file| require file}
    TOKEN =igougougou'
    timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
    codes = [TOKEN, timestamp, nonce].sort.join('')
    halt(401) unless Digest::SHA1.hexdigest(codes) == params[:signature]

  end
end
