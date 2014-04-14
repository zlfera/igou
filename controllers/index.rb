module App
  class Gougou < Sinatra::Base
    get '/index' do
      params[:echostr]
      slim :index
    end

    post '/indexx' do
      if params[:xml][:MsgType] == "text"
        render "index", :formats => :xml
      end
    end
  end
end
