class UserMailer < ActionMailer::Base
  default from: "donthackmeplz6@gmail.com"

	def seek_email(member)
			@user = member
			@url = 'http://locationtracker.herokuapp.com/locations'
			mail(to:@user.email, subject:"[BAMRU Location Tracker] Where Are You?")
	end

end
