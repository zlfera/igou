class ApplicationController < Sinatra::Base
  
  set :views, File.expand_path('../../views', __FILE__)
  set :slim, layout_options: { views: 'views/layouts' }
  
  get '/' do
      slim :'home/index'
  end
  
end
