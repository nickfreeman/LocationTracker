class MembersController < ApplicationController

  def show
  end

  def index
    @members = Member.all
  end

  def new
  end

  def create
    @members = Member.create!(params[:member])
    redirect_to members_path
  end

	#def email
		#@members = Member.all
		#if @members.length == 2
			#flash[:notice] =  "No members available."
			#render "/index"
		#else
			#@members.each do |member|
				#UserMailer.seek_email(member).deliver
			#end
			#redirect_to "/success"
		#end
	#end

	def email
		@members = Member.all
		@members.each do |member|
			UserMailer.seek_email(member).deliver
		end
		redirect_to "/members#index"
	end

end
