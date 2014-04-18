module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api', provides: 'xml' do
      content_type :xml, charset: 'utf-8'
      request.body.rewind
      if params[:xml][:MsgType] == 'text'
        cd = "<xml>
                <ToUserName><![CDATA[ #{params[:xml][:FromUserName]} ]]></ToUserName>
                <FromUserName><![CDATA[ #{params[:xml][:ToUserName]} ]]></FromUserName>
                <CreateTime> #{Time.now.to_i} </CreateTime>
                <MsgType><![CDATA[text]]></MsgType>
                <Content><![CDATA[re: #{params[:xml][:Content]} ]]></Content>
                <FuncFlag>0</FuncFlag>
              </xml>"
        
      end
    end
    get '/' do
      content_type 'text/xml'
      slim :'home/index'
    end
    
  end
end
