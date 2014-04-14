module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
    get '/' do
      'zenglingfa'
    end
    
    
  end
end
