class UserMailer < ActionMailer::Base
  default from: "donthackmeplz6@gmail.com"

	def seek_email(member)
			@user = member
			@url = 'http://facebook.com'
			mail(to:@user.email, subject:"Where Are You?")
	end

end
