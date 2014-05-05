$:.unshift(File.expand_path('../../lib', __FILE__))

class ApplicationController < Sinatra::Base
  
  
  
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
