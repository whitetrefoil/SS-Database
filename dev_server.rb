# encoding: utf-8
require 'sinatra/base'
require 'coffee-script'
require 'sass'

module Tilt
  class CoffeeScriptTemplate < Template
    alias_method :original_prepare, :prepare

    def prepare
      @data.force_encoding 'UTF-8'
      original_prepare
    end
  end
end

class DevServer < Sinatra::Base
  configure do
    set :root, File.dirname(__FILE__)
    set :views, 'src'
    set :bind, '0.0.0.0'
    set :port, 4567
  end

  get '/css/*.css' do
    sass :"#{params[:splat][0]}", :cache => false, :style => :expanded, :views => 'src/css/sass' rescue pass
  end

  get '/js/*.js' do
    coffee :"#{params[:splat][0]}", :views => 'src/js/coffee' rescue pass
  end

  get '/*' do
    send_file settings.views + '/' + params[:splat][0] rescue pass
  end

  not_found do
    status 404
    'Not found'
  end

  run! if app_file == $0
end
