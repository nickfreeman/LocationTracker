# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Member.create!({:name => 'Yina Jin', :email => 'solaris.jin@gmail.com', :role => #'goddess'})

User.create!({:name => 'Yeung John Li', :email => 'liyeungjohn@yahoo.ca', :password => 'liyeungjohn', :password_confirmation => 'liyeungjohn', :role => 'field', :remember_me => 'yes'})
User.create!({:name => 'Yina Jin', :email => 'solaris.jin@gmail.com', :password => 'jinyina_password', :password_confirmation => 'jinyina_password', :role => 'field', :remember_me => 'yes'})
User.create!({:name => 'Shaumik Mondal', :email => 'themaster_759@hotmail.com', :password => 'mondalshaumik', :password_confirmation => 'mondalshaumik', :role => 'AHC', :remember_me => 'yes'})
User.create!({:name => 'James Kim', :email => 'james@email.com', :password => 'kimjames', :password_confirmation => 'kimjames', :role => 'AHC', :remember_me => 'yes'})



Location.create!({:latitude => 22.572646, :longitude => 88.363895})
Location.create!({:latitude => 27.469287, :longitude => 85.517578})
Location.create!({:latitude => 28.401065, :longitude => 89.494629})

