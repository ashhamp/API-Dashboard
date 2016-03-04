require "./lib/geolocation"
require "./lib/weather"
require "./lib/events_class"
require "./lib/news_class"
require "sinatra/base"
require 'pry'

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    erb :dashboard
  end

  get "/weather" do

    @ip = request.ip
    @place = Geolocation.new(@ip)

    @weather = Weather.new(@place)
    @temp = @weather.temperature

    erb :weather
  end

  get "/news" do

    @news = News.new

    erb :news

  end

  get "/events" do

    @ip = request.ip
    @place = Geolocation.new(@ip)

    @city_events = Events.new(@place)
  
    erb :events

  end
end
