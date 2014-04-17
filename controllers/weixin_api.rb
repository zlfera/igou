module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    post '/weixin_api', provides: 'xml' do
      content_type :xml, charset: 'utf-8'
      request.body.rewind
      #if params[:xml][:MsgType] == 'text'
        slim :'weixin_api/reply'
      #end
    end
    get '/' do
      'zeng'
    end
    
  end
end
