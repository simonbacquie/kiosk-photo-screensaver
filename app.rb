require 'sinatra'
require 'image_loader.rb'

class MyApp < Sinatra::Base

  @image_loader = ImageLoader.new(ENV['mode'], ENV['sort'], ENV['stretch'])

  get '/' do
    erb :'index.html'
  end

  get '/js/screensaver.js' do
    content_type :js
    erb :'screensaver.js'
  end

  get '/css/style.css' do
    content_type :css
    erb :'style.css'
  end

end
