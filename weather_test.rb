require 'httparty'
require 'dotenv'
Dotenv.load

key = ENV["NY_TIMES_API_KEY"]
response = HTTParty.get("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{key}")
require 'pry'
binding.pry
response.body
