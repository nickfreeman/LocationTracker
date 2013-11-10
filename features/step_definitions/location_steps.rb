Given /I am logged in as a member/ do
	@user = User.new()
end

Then /my location should be registered/ do
	# Do this in JASMINE
end

Then /I should be asked to share my location/ do
	# Do this in JASMINE
end

Given /my location is in the database/ do
	@location = Locations.create!({longitude: 323.2, latitude: 3432.3})
end

Then /I should see my location/ do
	page.should have_content(@location.longitude.to_s)
end