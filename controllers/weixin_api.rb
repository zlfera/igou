module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api' do
      content_type :xml, charset: 'utf-8'
      
      
      root = Nokogiri::XML(request.body.read).root
      if @message_type = root.xpath('MsgType').children.text
        @receiver = root.xpath("ToUserName").children.text
        @sender = root.xpath("FromUserName").children.text
        @send_time = Time.at(root.xpath("CreateTime").text.to_i)
        @keyword = root.xpath("Content").children.text
        @message_id = root.xpath("MsgId").text.to_i
        nokogiri :"weixin_api/#{@message_type.to_s}"

        
      end
    end
    get '/' do
      slim :'home/index'
    end
    
  end
end
