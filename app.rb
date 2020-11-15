require 'sinatra'
require 'json'

class MyApp < Sinatra::Base

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
