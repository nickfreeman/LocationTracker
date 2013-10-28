Given /I am logged in as a member/
	#Integrate this with the member stuff later
	@user = Member.new
end

Then /my location should be registered/
	Locations.find_by_member(@user).should_not be_nil
end