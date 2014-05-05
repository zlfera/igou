$:.unshift(File.expand_path('../../lib', __FILE__))

class ApplicationController < Sinatra::Base
  
  #set :public_folder, File.expand_path('../../public', __FILE__) 
  set :views, File.expand_path('../../views', __FILE__)
  set :slim, layout_options: { views: 'views/layouts' }
  
  helpers ApplicationHelper
  get '/' do
    @user = User.new(email: 'zlfera@msn.com', password: '123')
    @user.save
    slim :'home/index'
  end
  
  get '/create' do
    
    slim :'home/create'
  end
  
end
