require 'spec_helper'

describe Weather do

  let(:place) { Geolocation.new ("8.8.8.8") }

  let(:weather) { Weather.new(place) }

  describe ".new" do
    it "has a location that is a Geolocation" do
      expect(weather.location).to be_a(Geolocation)
    end
  end
end
