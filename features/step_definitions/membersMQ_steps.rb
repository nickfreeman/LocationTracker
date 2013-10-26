Given /the following member info exist/ do |member_table|
  emails_table.hashes.each do |member|
    Member.create(member)
  end
end

Then /I should see Successfully Sent/ do
     step %{I should see "Successfully Sent"}
end

Then /I should see No members available/ do
    if Email.count == 0
      step %{I should see "No members available"}
    end
end
