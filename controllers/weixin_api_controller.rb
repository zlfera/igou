class WeixinApiController < ApplicationController
  ###############################
  TOKEN = 'igougougou'
    
  before do
    require 'digest/sha1'
    timestamp, nonce = params[:timestamp].to_s, params[:nonce].to_s
    codes = [TOKEN, timestamp, nonce].sort.join()
    status 200 unless Digest::SHA1.hexdigest(codes) == params[:signature]
  end
  ###############################
    get '/' do
      params[:echostr]
    end
    
    post '/' do
      content_type :xml, charset: 'utf-8'
      
      
      root = Nokogiri::XML(request.body.read).root
      @message_type = root.css('MsgType').children.text
        
      @receiver = root.css("ToUserName").children.text
      @sender = root.css("FromUserName").children.text
      @send_time = Time.at(root.css("CreateTime").text.to_i)
      @content = root.css("Content").children.text
      @message_id = root.css("MsgId").text.to_i
      ###
      #@pic_url = root.css('PicUrl').children.text
        
      nokogiri :"weixin_api/#{@message_type.to_s}"

        
    end

    
    
end
