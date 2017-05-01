require_relative "config/application"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @restaurants = Restaurant.all
  @name = 'Nicholas'

  erb(:home)
end

get "/welcome" do
  "Welcome to my app"
end

# Capture the form results from the form on /restaurants/new
post "/restaurants" do
  puts 'Hey here is the form data'
  p params["restaurant"]

  Restaurant.create(params["restaurant"])

  redirect '/'
end

get "/restaurants/new" do
  erb :'restaurants/new'
end

# READ
# http://localhost:4567/restaurants/1
get "/restaurants/:id" do
  @restaurant = Restaurant.find(params['id'])

  erb :'restaurants/show'
end


