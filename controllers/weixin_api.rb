module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api', provides: 'xml' do
      content_type :xml, charset: 'utf-8'
      #if params[:xml][:MsgType] == 'text'
        
        root = Nokogiri::XML(request.body.read).root
        @receiver = root.xpath("ToUserName").children.text
        @sender = root.xpath("FromUserName").children.text
        @send_time = Time.at(root.xpath("CreateTime").text.to_i)
        @keyword = root.xpath("Content").children.text
        @message_type = root.xpath("MsgType").children.text
        @message_id = root.xpath("MsgId").text.to_i
        nokogiri :'home/reply'

        
        slim :'home/reply'
      #end
    end
    get '/' do
      slim :'home/index'
    end
    
  end
end
