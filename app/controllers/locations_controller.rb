class LocationsController < ApplicationController
	
	def show
		id = params[:id]
		@location = Location.find(id)
	end

	def index
		#TODO create a map that shows the corresponding stuff
		@locations = Location.all
	end
	
	def new
		#TODO
	end

	def create
		@location = Location.new
		@location.longitude = params[:longitude]
		@location.latitude = params[:latitude]
	    if @location.save!
	    	flash[:notice] = "Location successfully saved"
	    	redirect_to locations_path
	    end
    end

	def update
		@location = Location.find(params[:id])
		@location.longitude = params[:longitude]
		@location.latitude = params[:latitude]
		flash[:notice] = "Location successfully updated"
		redirect_to locations_path
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy
		flash[:notice] = "Location data deleted"
		redirect_to locations_path
	end
end
