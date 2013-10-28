class Location < ActiveRecord::Base
	attr_accessible :time, :latitude, :longitude, :id
end