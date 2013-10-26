Given /the following member info exist/ do |member_table|
  member_table.hashes.each do |member|
    Member.create!(member)
  end
end

Given /I am a logged in member/ do
	#login feature not implemented yet
end

Then /I should see Successfully Sent/ do
     step %{I should see "Successfully Sent"}
end

Given /empty database/ do 
  Member.destroy_all
end

Then /I should see No members available/ do
    if Email.count == 0
      step %{I should see "No members available"}
    end
end
