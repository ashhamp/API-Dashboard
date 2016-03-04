# your code, here.
require 'net/http'
require 'json'


class Events
  attr_reader :location, :date, :data

  def initialize(location, date = Time.now.strftime("%Y-%d-%m"))
    @location = location
    @date = date
    @data = create_events_data
  end

  def events
    events = ""
    @data['events'].each do |event|
      events += "* #{event['performers'].first['name']} @ #{event['venue']['name']}\n"
    end
    events
  end


private

def create_events_data
 response = Net::HTTP.get(uri)
 JSON.parse(response)
end

def uri
 URI("https://api.seatgeek.com/2/events?datetime_local.gte=#{@date}&venue.state=#{@location.state}&venue.city=#{@location.city}")
end

end
