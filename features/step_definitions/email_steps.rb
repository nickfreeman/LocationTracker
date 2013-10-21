Given /the following member info exist/ do |emails_table|
  emails_table.hashes.each do |email|
    Email.create(email)
  end
end

Then /I should see list of all the members that receive the email/ do
  assert Email.count == page.all('table#emails tbody tr').count

Then /I should see no active member in field/ do
    if Email.count == 0
      step %{I should see "No active member in field"}
    end

