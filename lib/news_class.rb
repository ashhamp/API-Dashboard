require "net/http"
require "json"
require 'dotenv'
Dotenv.load
require 'pry'




class News
  attr_reader :data

  def initialize
    @data = create_news_data

  end

  private

   def create_news_data
    response = Net::HTTP.get(uri)
    JSON.parse(response)
   end

   def uri
    key = ENV["NY_TIMES_API_KEY"]
    URI("http://api.nytimes.com/svc/topstories/v1/home.json?api-key=#{key}")
   end
end
