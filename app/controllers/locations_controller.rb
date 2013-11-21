class LocationsController < ApplicationController
	
	def show
		id = params[:id]
		@location = Location.find(id)
	end

	def index
		#TODO create a map that shows the corresponding stuff
		@locations = Location.all
		#Sorting the list of locations
		@locations = Location.find(:all, :order => 'name') if params[:sort] == 'name'
		@locations = Location.find(:all, :order => 'updated_at') if params[:sort] == 'time'
	end
	
	def new
		#TODO
	end

	def create
		@location = Location.new
		@location.longitude = params[:longitude]
		@location.latitude = params[:latitude]
		#puts"**********************************************************"
		@location.name = current_user.name
		#puts @location.name
		if params[:id]
			@location.id = params[:id]
		end
	    if @location.save!
	    	flash[:notice] = "Location successfully saved"
	    	redirect_to locations_path
	    end
    end

	def update
		@location = Location.find(params[:id])
		@location.longitude = params[:longitude]
		@location.latitude = params[:latitude]
		@location.name = current_user.name
		#puts "---------------------------------------------------------"
		#puts @location.name
		if @location.save!
			flash[:notice] = "Location successfully updated"
			redirect_to locations_path
		end
	end

	def destroy
		@location = Location.find(params[:id])
		@location.destroy
		flash[:notice] = "Location data deleted"
		redirect_to locations_path
	end
end
