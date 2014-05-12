$LOAD_PATH.unshift(File.expand_path('../../lib', __FILE__))
#
class ApplicationController < Sinatra::Base
  set :public_folder, File.expand_path('../../public', __FILE__)
  set :views, File.expand_path('../../views', __FILE__)
  set :slim, layout_options: { views: 'views/layouts' }
  # set :static, false
  helpers ApplicationHelper

  get '/' do
    cache_control :public, :must_revalidate, :max_age => 60
    @user = User.new(email: 'zlfera@msn.com',
                     password: '123',
                     content: 'hello,zeng')
    @user.save
    slim :'home/index'
  end

  get '/create' do
    slim :'home/create'
  end

  not_found do
    'sorry,there is no you want'
  end
end
