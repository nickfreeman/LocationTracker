class LocationsController < ApplicationController
	
	def show
		id = params[:id]
		@location = Locations.find(id)
	end

	def index
		#TODO create a map that shows the corresponding stuff
		@locations = Locations.all
	end
	
	def new
		#TODO
	end

	def create
		user = params[:member]
		@longitude = params[:longitude]
	   	@latitiude = params[:latitude]
	   	time = Time.now
		@location = Location.create!(longitude: longitude, latitude: latitude, member: user, time: time)
	   	redirect_to locations_path
	   end

	def update
		@location = Location.find(params[:id])
		@location.longitude = params[:longitude]
		@location.latitude = params[:latitude]
		@location.time = Time.now
		flash[:notice] = "Location successfully updated"
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy
		flash[:notice] = "Location data deleted"
	end
end
