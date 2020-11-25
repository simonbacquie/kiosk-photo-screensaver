require 'sinatra'
require 'json'
require './image_loader.rb'
require './time_settings.rb'

class MyApp < Sinatra::Base

  def image_loader
    ImageLoader.new(ENV['MODE'], ENV['SORT'], ENV['STRETCH'])
  end

  def time_settings
    TimeSettings.new(ENV['STOP_TIME'], ENV['TRANSITION_TIME'])
  end

  get '/' do
    erb :'index.html'
  end

  get '/js/screensaver.js' do
    @image_loader = image_loader
    @time_settings = time_settings
    content_type :js
    erb :'screensaver.js'
  end

  get '/css/style.css' do
    @image_loader = image_loader
    content_type :css
    erb :'style.css'
  end

end
