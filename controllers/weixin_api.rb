module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api' do
      
      if params[:xml][:MsgType] == 'text'
        slim :reply
      end
    end
    
    
  end
end
