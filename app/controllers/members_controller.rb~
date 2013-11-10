class MembersController < ApplicationController

  def show
  end

  def index
    @members = User.all
  end

  def new
  end

  def create
    @members = User.create!(params[:member])
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
    @members_temp = params[:members]? params[:members].keys : []
		@members = User.find(:all, :conditions => {:name => @members_temp})
   	#@movies = Movie.find(:all, :conditions => {:rating => (@curr_ratings==[]? @all_ratings : @curr_ratings)})
		puts @members
		puts @members.length
		if @members.length == 0
			flash[:notice] = "No members available"
			redirect_to "/members"
		else
			@members.each do |member|
				UserMailer.seek_email(member).deliver
			end
			redirect_to success_members_path(:members => params[:members])
		end
	end
	
	def success
		@members_temp = params[:members]? params[:members].keys : []
		@members = User.find(:all, :conditions => {:name => @members_temp})
	end

end
