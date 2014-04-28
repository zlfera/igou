module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api' do
      content_type :xml, charset: 'utf-8'
      
      
      root = Nokogiri::XML(request.body.read).root
      @message_type = root.css('MsgType').children.text
        
      @receiver = root.css("ToUserName").children.text
      @sender = root.css("FromUserName").children.text
      @send_time = Time.at(root.css("CreateTime").text.to_i)
      @content = root.css("Content").children.text
      @message_id = root.css("MsgId").text.to_i
      ###
      @pic_url = root.css('PicUrl').children.text
        
      nokogiri :"weixin_api/#{@message_type.to_s}"

        
    end
    get '/' do
      slim :'home/index'
    end
    get '/user' do
puts "Collections"

puts "==========="

      collections = User.new

puts collections



    end
    
  end
end
