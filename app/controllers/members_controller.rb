class MembersController < ApplicationController


  def response
 
  end
  def show
  end

  def index
		@members = Member.find(:all)
  end

  def new
  end

  def create
    @members = Member.create!(params[:member])
  end

	def email
		@members.each |member|
			UserMailer.seek_email(member).deliver
	end

end
