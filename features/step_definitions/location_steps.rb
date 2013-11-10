Given /I am logged in as a member/ do
	#@user = Member.create!()
	@user = 5
end

When /^I click on "([^"]*)"$/ do |selector|
	page.execute_script("jQuery(#{selector.to_json}).click();")
end

Then /my location should be registered/ do
	# Do this in JASMINE
end

Then /I should be asked to share my location/ do
	# Do this in JASMINE
end

Given /my location is in the database/ do
	@location = Location.create!({longitude: 323.2, latitude: 3432.3})
end

Then /I should see my location/ do
	visit locations_path
	page.should have_content(@location.longitude.to_s)
end