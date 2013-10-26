class UserMailer < ActionMailer::Base
  default from: "system@bamru.org"

	def seek_email(member)
		@user = member
		@url = 'http://facebook.com'
		mail(to:@user.email, subject:"Where Are You?")
	end

end
