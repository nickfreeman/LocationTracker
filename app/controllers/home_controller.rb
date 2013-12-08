class HomeController < ApplicationController

  def index
  end

  def show()

    @autocomplete_people = (User.all.map(&:name) + Tags.all.map(&:label)).uniq
  	@locations = [[37.488902,-122.230657, 'HeadQuarter','']]
  	@tracing = false
    
	  if Location.count != 0
      if params[:search_name] == nil or params[:search_name] == ""
        if params[:search_time] == nil or params[:search_time] == "" or params[:search_time] == 0
          session.delete(:search_time)
          @geolocations = Location.all
        else
          session[:search_time] = params[:search_time]
          @geolocations = Location.where(:updated_at => params[:search_time].to_i.minutes.ago..Time.now)
        end
        
  	  else

        if session[:search_time] == nil or session[:search_time] == "" or session[:search_time] == 0
          @geolocations = Location.where("name = ?", params[:search_name])
	  if @geolocations == nil
	      tags = Tags.where("label = ?", params[:search_name])
	      tags.each do |tag|	
	      	@geolocations += Location.where("name = ?", tag.user_id)
	      end
	  end
        else
          @geolocations = Location.where(:updated_at => session[:search_time].to_i.minutes.ago..Time.now).where("name = ?", params[:search_name])
	  if @geolocations == nil
	      tags = Tags.where("label = ?", params[:search_name])
	      tags.each do |tag|
		@geolocations += Location.where(:updated_at => session[:search_time].to_i.minutes.ago..Time.now).where("name = ?", tag.user_id)
	      end
	  end
        end

        #@geolocations = Location.where("name = ?", params[:search_name])
        @tracing = true
        
      end
    @geolocations.each{ |locate| @locations.push([locate.latitude,locate.longitude, locate.name, locate.updated_at.to_s])}
    end
    #puts "---------------******************_----------------------**************--------------------"
    #puts @locations
  end
end
