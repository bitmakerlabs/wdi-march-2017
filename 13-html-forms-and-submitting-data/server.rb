require './film.rb'
require 'sinatra'
require 'pry'

get '/' do
  erb :index
end

get '/films' do
  "GET request: #{params}"
end


post '/films' do
  Film.create(params)
  redirect to('/')  
end

put '/films' do
  "PUT request: #{params}"
end

delete '/films' do
  "DELETE request: #{params}"
end
