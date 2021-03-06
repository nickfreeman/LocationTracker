Given /^the following locations exist$/ do |locations_table|
  locations_table.hashes.each do |location|
    Location.create!(location)
  end
  #flunk "Unimplemented"
end

Then /I should only see locations with "(.*)"/ do |user|
	
	page.find('#map-canvas')
	# Check to make sure the counter == 3 (manually)
end

Given /I am logged in and on the map page/ do
	@visitor ||= { :name => "Testy McUserton", :email => "example@email.com",
    :password => "changeme", :password_confirmation => "changeme" }
	visit '/users/sign_up'
	fill_in "user_name", :with => @visitor[:name]
  	fill_in "user_email", :with => @visitor[:email]
  	fill_in "user_password", :with => @visitor[:password]
  	fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  	click_button "Sign up"
end

Given /I have created users/ do
  tag_label = "group 1"
  users_table.hashes.each do |user|
    created_user = User.create!(user)
    if user.name == "Jeffery Dahmer" or user.name == "Ted Bundy"
      Tags.create(:label => tag_label, :user_id => created_user.id)
    end
  end
end

Then /I should only see locations with group "(.*)"/ do |group|
  page.find('#map-canvas')
end

Then /I should see all of the locations/ do
  page.find('#map-canvas')
end
