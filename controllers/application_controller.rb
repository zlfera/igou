#
class ApplicationController < Sinatra::Application
  set :public_folder, File.expand_path('../../public', __FILE__)
  set :views, File.expand_path('../../views', __FILE__)
  set :slim, layout_options: { views: 'views/layouts' }
  # set :static, false
  helpers ApplicationHelper

  get '/' do
    cache_control :public, :must_revalidate, max_age: 60
    @user = User.new(email: 'zlfera@msn.com',
                     password: '123',
                     content: 'hello,zeng')
    @user.save
    @title_name = 'weixin'
    slim :'home/index'
  end

  get '/create' do
    @title_name = 'create'
    slim :'home/create'
  end

  not_found do
    'sorry,there is no you want'
  end
end
