class Location < ActiveRecord::Base
	attr_accessible :latitude, :longitude, :id, :name

	belongs_to :user

end
