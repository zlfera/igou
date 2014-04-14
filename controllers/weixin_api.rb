module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    

    
    
    
  end
end
