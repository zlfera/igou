module App
  class Gougou < Sinatra::Base
    get '/weixin_api' do
      params[:echostr]
    end
    
  get '/h' do
    'gggg'
  end
  get '/g' do
    'hhhh'
  end
    
    
    
  end
end
