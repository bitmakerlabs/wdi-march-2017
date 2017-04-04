require 'sinatra'

# '/' is the homepage
get '/' do
  'Hello Dave!'
end

get '/goodbye' do
  erb :goodbye
end

# get '/movies/lotr' do
#   'Lord of the Rings'
# end
#
# get '/movies/batmanbegins' do
#   'Batman Begins'
# end

get '/movies/:title' do
  @title = params[:title]
  @server_time = Time.now

  erb :movie
end
