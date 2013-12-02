class HomeController < ApplicationController
  def index
  end

  def show()
    #puts "\n\n\n\n\n"
    #puts params[:search_time]

    @autocomplete_people = User.all.map(&:name)
  	@locations = [[37.488902,-122.230657, 'HeadQuarter','']]
    
	  if Location.count != 0
      if params[:search_name] == nil or params[:search_name] == ""
        
    		@geolocations = Location.all
        #@geolocations = Location.where(:created_at => params[:search_time].minutes.ago..Time.now)
        
  	  else
        
        @geolocations = Location.where("name = ?", params[:search_name])
        
      end
    @geolocations.each{ |locate| @locations.push([locate.latitude,locate.longitude, locate.name, locate.updated_at.to_s])}
    end
    #puts "---------------******************_----------------------**************--------------------"
    #puts @locations
  end
end
