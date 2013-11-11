class HomeController < ApplicationController
  def index
  end

  def show
    geolocations = Location.all
    @locations = []
    geolocations.each{ |locate| @locations.push([locate.latitude,locate.longitude])}
    puts "---------------******************_----------------------**************--------------------"
    puts @locations
  end
end
