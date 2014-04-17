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
        render
      #end
    end
    get '/' do
      slim :'home/index'
    end
    
  end
end
