class Gougou < Sinatra::Base
  get '/index' do
    params[:echostr]
  end

  post '/index' do
    
  end

end
