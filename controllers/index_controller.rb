#
class IndexController < ApplicationController
  get '/index' do
    @title_name = 'zeng wang zhi dao hang'
    slim :'zeng/index'
  end
end
