class UserMailer < ActionMailer::Base
  default from: "donthackmeplz6@gmail.com"

	def seek_email(member)
			@user = member
			@url = 'localhost:3000/locations'
			mail(to:@user.email, subject:"[BAMRU Location Tracker] Where Are You?")
	end

end
