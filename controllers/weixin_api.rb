module App
  class Gougou < Sinatra::Base
   # gett '/weixin_api' do
    #  params[:echostr]
    #end
    
    #post '/weixin_api' do
      
     # if params[:xml][:MsgType] == 'text'
      #  slim :'weixin_api/reply'
      #end
    #end
    get '/weixin_api' do
      slim :'weixin_api/reply'
    end
    
  end
end
