module App
  class Gougou < Sinatra::Base
    get '/index' do
      params[:echostr]
    end
    
  get '/h' do
    'gggg'
  end
  get '/g' do
    'hhhh'
  end
    
    post '/index' do
      
    end
  
  end
end
