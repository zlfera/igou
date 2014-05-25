#
class IndexController < ApplicationController
  get '/index' do
    @css_path = '/css/index.css'
    @title_name = 'zeng wang zhi dao hang'
    slim :'zeng/index'
  end
end