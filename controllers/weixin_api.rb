module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api' do
      
      if params[:xml][:MsgType] == 'text'
        slim :'weixin_api/reply', :format :xml
      end
    end
    get '/' do
      201
    end
    
  end
end
