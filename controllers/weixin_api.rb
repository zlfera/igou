module App
  class Gougou < Sinatra::Base
    get '/weixin_apii' do
      #require 'digest/sha1'
      #timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
      #codes = [TOKEN, timestamp, nonce].sort.join()
      #Digest::SHA1.hexdigest(codes) == params[:signature]
      #status 200 
      #params[:echostr]
      check_token

    end
    
    post '/weixin_api', provides: 'xml' do
      #content_type :xml, charset: 'utf-8'
      #request.body.rewind
      content_type 'text/xml'
      #if params[:xml][:MsgType] == 'text'
        cd = "<xml>
                <ToUserName><![CDATA[ #{params[:xml][:FromUserName]} ]]></ToUserName>
                <FromUserName><![CDATA[ #{params[:xml][:ToUserName]} ]]></FromUserName>
                <CreateTime> #{Time.now.to_i} </CreateTime>
                <MsgType><![CDATA[text]]></MsgType>
                <Content><![CDATA[re: #{params[:xml][:Content]} ]]></Content>
                <FuncFlag>0</FuncFlag>
              </xml>"
        
      #end
    end
    get '/' do
      slim :'home/index'
    end
    
  end
end
