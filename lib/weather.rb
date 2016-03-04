require "net/http"
require "json"
require 'dotenv'
require_relative 'geolocation'
Dotenv.load
require 'pry'




class Weather
  attr_reader :location, :data

  def initialize(location)
    @location = location
    @data = create_weather_data
  end

  def temperature
    @data['current_observation']['temperature_string']

  end


private

  def create_weather_data
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end

  def uri
    key = ENV["WUNDERGROUND_API_KEY"]
    URI("http://api.wunderground.com/api/#{key}/conditions/q/#{@location.state}/#{@location.city}.json")
  end
end
