# encoding: utf-8
require 'sinatra/base'
require 'coffee-script'
require 'sass'

class DevServer < Sinatra::Base
  configure do
    set :root, File.dirname(__FILE__)
    set :views, 'src'
    set :bind, '0.0.0.0'
    set :port, 4567
  end

  get '/css/*.css' do
    sass :"#{params[:splat][0]}", :cache => false, :style => :expanded, :views => 'src/css/sass' rescue status 404
  end

  get '/js/*.js' do
    coffee :"#{params[:splat][0]}", :views => 'src/js/coffee' rescue status 404
  end

  get '/*' do
    send_file settings.views + '/' + params[:splat][0]
  end

  not_found do
    status 404
    'Not found'
  end

  run! if app_file == $0
end
