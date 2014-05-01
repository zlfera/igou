class ApplicationController < Sinatra::Base
  
  set :views, File.expand_path('../../views', __FILE__)
  set :slim, layout_options: { views: 'views/layouts' }
  
  get '/' do
    @user = User.new(email: 'zlfera@msn.com', password: '123')
    @user.save
    slim :'home/index'
  end
  
end
