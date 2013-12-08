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

When /I click or check "members_all"/ do
  @users = User.all
  @users.each do |user|
    s = user.name.gsub(" ", "_")
    step %{I check "members_#{s}"}
  end
end
