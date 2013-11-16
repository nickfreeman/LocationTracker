class HomeController < ApplicationController
  def index
  end

  def show
	if Location.count != 0
		geolocations = Location.all
		@locations = []
		geolocations.each{ |locate| @locations.push([locate.latitude,locate.longitude])}
	else
		@locations = [[37.488902,-122.230657]]
	end
    #puts "---------------******************_----------------------**************--------------------"
    #puts @locations
  end
end
