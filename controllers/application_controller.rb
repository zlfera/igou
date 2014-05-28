#
class ApplicationController < Sinatra::Base
  
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