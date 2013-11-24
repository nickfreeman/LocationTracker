class HomeController < ApplicationController
  def index
  end

  def show
  	@locations = [[37.488902,-122.230657, 'HeadQuarter','']]
	if Location.count != 0
		geolocations = Location.all
		geolocations.each{ |locate| @locations.push([locate.latitude,locate.longitude, locate.name, locate.updated_at.to_s])}
	end
    #puts "---------------******************_----------------------**************--------------------"
    #puts @locations
  end
end
