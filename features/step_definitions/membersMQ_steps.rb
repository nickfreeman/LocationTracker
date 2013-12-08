Given /the following users info exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end




Then /I should see all members/ do 
  @users = User.all
  @users.each do |user|
    page.has_content?(user.name)
  end
end 

Then /I should see "(.*)" before "(.*)"/ do |first, second|
  assert_match page.source, /#{first}.*#{second}.*/m
end
