module App
  class Gougou < Sinatra::Base
  get '/index' do
    params[:echostr]
  end

  post '/index' do
    if params[:xml][:MsgType] == "text"
      render "echo", :formats => :xml
    end

  end
end
