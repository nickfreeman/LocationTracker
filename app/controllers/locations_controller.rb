class LocationsController < ApplicationController
	
	def show
		id = params[:id]
		@location = Location.find(id)
	end

	def index
		@locations = Location.all
		#Sorting the list of locations ascending the first click then by descending the second click
		if (params[:sort] == 'name')
			if ((not session[:sort_name]) or session[:sort_name] == 'ascend')
				@locations = Location.find(:all, :order => 'name ASC')
				session[:sort_name] = 'descend'
			else
				@locations = Location.find(:all, :order => 'name DESC')
				session[:sort_name] = 'ascend'
			end
		end
		if (params[:sort] == 'time')
			if ((not session[:sort_time]) or session[:sort_time] == 'ascend')
				@locations = Location.find(:all, :order => 'updated_at ASC')
				session[:sort_time] = 'descend'
			else
				@locations = Location.find(:all, :order => 'updated_at DESC')
				session[:sort_time] = 'ascend'
			end
		end
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
